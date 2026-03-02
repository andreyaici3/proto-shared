PROTO_DIR=proto
GEN_DIR=gen

PROTO_FILES=$(wildcard $(PROTO_DIR)/*.proto)

.PHONY: gen clean

gen:
	mkdir -p $(GEN_DIR)
	protoc \
	--go_out=$(GEN_DIR) --go_opt=paths=source_relative \
	--go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative \
	$(PROTO_FILES)

clean:
	rm -rf $(GEN_DIR)/*