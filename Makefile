REBAR := ./rebar

.PHONY: \
	all \
	clean \
	compile \
	dialyze \
	dialyzer_plt_build

all: \
	clean \
	compile \
	dialyze

compile:
	$(REBAR) compile

clean:
	$(REBAR) clean

dialyze:
	@dialyzer $(shell \
		find . -name '*.beam' \
	)

dialyzer_plt_build:
	@dialyzer \
		--build_plt \
		--apps $(shell ls $(shell \
			erl -eval 'io:format(code:lib_dir()), init:stop().' -noshell) \
			| grep -v interface \
			| sed -e 's/-[0-9.]*//' \
		)
