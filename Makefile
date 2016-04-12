ERL=erl
BEAMDIR=./deps/*/ebin ./ebin
REBAR=rebar3

all: clean update get-deps compile xref

update:
	@$(REBAR) update

get-deps:
	@$(REBAR) upgrade

compile:
	@$(REBAR) compile

xref:
	@$(REBAR) xref

clean: 
	@ $(REBAR) clean

eunit:
	@rm -rf .eunit
	@mkdir -p .eunit
	@ERL_FLAGS="-config test.config" $(REBAR) eunit

test: eunit

edoc:
	@$(REBAR) edoc
