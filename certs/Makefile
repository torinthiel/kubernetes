# List all CA (root-level) certificates
CA_CERTIFICATES := ca-etcd.crt

# List all non-CA certificates
OTHER_CERTIFICATES := etcd1.crt


all: $(OTHER_CERTIFICATES)


# For all leaf certificates, list them here with dependency on a CA certificate
etcd1.crt: ca-etcd.crt


##########################
# Rules below

# For some weird reason make removes the keyfiles for non-CA certificates
# Kudos if someone tells me why
all: $(OTHER_CERTIFICATES:.crt=.key)

%.key:
	openssl genpkey -out $@ -algorithm rsa

%.csr: %.key %.cnf
	openssl req -out $@ -key $< -new -config $*.cnf

%.crt: %.csr
	openssl x509 -req -in $< -CA

$(CA_CERTIFICATES): %.crt : %.csr %.key %.cnf
	openssl x509 -req -in $< -signkey $*.key -out $@ -extfile $*.cnf -extensions ca_ext

$(OTHER_CERTIFICATES): %.crt : %.csr
	openssl x509 -req -in $< -out $@ \
		-CA $(basename $(lastword $^)).crt -CAkey $(basename $(lastword $^)).key \
		-CAcreateserial -extfile $(basename $(lastword $^)).cnf -extensions usr_ext


clean:
	rm -f $(CA_CERTIFICATES) $(CA_CERTIFICATES:.crt=.csr) $(CA_CERTIFICATES:.crt=.key) $(CA_CERTIFICATES:.crt=.srl) \
		$(OTHER_CERTIFICATES) $(OTHER_CERTIFICATES:.crt=.csr) $(OTHER_CERTIFICATES:.crt=.key)
