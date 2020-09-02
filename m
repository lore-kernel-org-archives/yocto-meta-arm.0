Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.561.1599023390346225780
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Sep 2020 22:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7390540C23;
	Wed,  2 Sep 2020 05:09:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1X_DnKlwdfj; Wed,  2 Sep 2020 05:09:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4028640027;
	Wed,  2 Sep 2020 05:09:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9757B17446B; Wed,  2 Sep 2020 01:09:47 -0400 (EDT)
Date: Wed, 2 Sep 2020 01:09:47 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee-examples: Respect LDFLAGS passed via environment
Message-ID: <20200902050947.GV17660@denix.org>
References: <20200902041918.3645954-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200902041918.3645954-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

vasibale???
I'm usually fine with one or two typos, but this is a new word! :)


On Tue, Sep 01, 2020 at 09:19:18PM -0700, Khem Raj wrote:
> This ensures right linking flags e.g. gnu_hash settings
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-make-Pass-ldflags-during-link.patch  | 102 ++++++++++++++++++
>  .../optee/optee-examples_git.bb               |   4 +-
>  2 files changed, 105 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
> 
> diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
> new file mode 100644
> index 0000000..1a8d630
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
> @@ -0,0 +1,102 @@
> +From 29ae21de41f2fbab6dbecbbf408826b28de82df1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 1 Sep 2020 21:09:56 -0700
> +Subject: [PATCH] make: Pass ldflags during link
> +
> +OpenEmbeeded needs to pass essential linker flags to set correct flags
> +for gnu_hash among others which sets the linking straight
> +Not using this vasibale means, we can set the knobs via Make environemnt
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + acipher/host/Makefile        | 2 +-
> + aes/host/Makefile            | 2 +-
> + hello_world/host/Makefile    | 2 +-
> + hotp/host/Makefile           | 2 +-
> + random/host/Makefile         | 2 +-
> + secure_storage/host/Makefile | 2 +-
> + 6 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/acipher/host/Makefile b/acipher/host/Makefile
> +index 8f4bc8a..c2cabef 100644
> +--- a/acipher/host/Makefile
> ++++ b/acipher/host/Makefile
> +@@ -18,7 +18,7 @@ BINARY = optee_example_acipher
> + all: $(BINARY)
> + 
> + $(BINARY): $(OBJS)
> +-	$(CC) -o $@ $< $(LDADD)
> ++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> + 
> + .PHONY: clean
> + clean:
> +diff --git a/aes/host/Makefile b/aes/host/Makefile
> +index dfeb4e8..f61c71b 100644
> +--- a/aes/host/Makefile
> ++++ b/aes/host/Makefile
> +@@ -18,7 +18,7 @@ BINARY = optee_example_aes
> + all: $(BINARY)
> + 
> + $(BINARY): $(OBJS)
> +-	$(CC) -o $@ $< $(LDADD)
> ++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> + 
> + .PHONY: clean
> + clean:
> +diff --git a/hello_world/host/Makefile b/hello_world/host/Makefile
> +index c4c8239..69cf42c 100644
> +--- a/hello_world/host/Makefile
> ++++ b/hello_world/host/Makefile
> +@@ -18,7 +18,7 @@ BINARY = optee_example_hello_world
> + all: $(BINARY)
> + 
> + $(BINARY): $(OBJS)
> +-	$(CC) -o $@ $< $(LDADD)
> ++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> + 
> + .PHONY: clean
> + clean:
> +diff --git a/hotp/host/Makefile b/hotp/host/Makefile
> +index cb7fd19..e7f013f 100644
> +--- a/hotp/host/Makefile
> ++++ b/hotp/host/Makefile
> +@@ -18,7 +18,7 @@ BINARY = optee_example_hotp
> + all: $(BINARY)
> + 
> + $(BINARY): $(OBJS)
> +-	$(CC) -o $@ $< $(LDADD)
> ++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> + 
> + .PHONY: clean
> + clean:
> +diff --git a/random/host/Makefile b/random/host/Makefile
> +index fd407d9..9377f7a 100644
> +--- a/random/host/Makefile
> ++++ b/random/host/Makefile
> +@@ -18,7 +18,7 @@ BINARY = optee_example_random
> + all: $(BINARY)
> + 
> + $(BINARY): $(OBJS)
> +-	$(CC) -o $@ $< $(LDADD)
> ++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> + 
> + .PHONY: clean
> + clean:
> +diff --git a/secure_storage/host/Makefile b/secure_storage/host/Makefile
> +index 29bfb87..b3265ae 100644
> +--- a/secure_storage/host/Makefile
> ++++ b/secure_storage/host/Makefile
> +@@ -18,7 +18,7 @@ BINARY = optee_example_secure_storage
> + all: $(BINARY)
> + 
> + $(BINARY): $(OBJS)
> +-	$(CC) -o $@ $< $(LDADD)
> ++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> + 
> + .PHONY: clean
> + clean:
> +-- 
> +2.28.0
> +
> diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_git.bb
> index 04cc5fd..71be593 100644
> --- a/meta-arm/recipes-security/optee/optee-examples_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
> @@ -13,7 +13,9 @@ inherit python3native
>  
>  require optee.inc
>  
> -SRC_URI = "git://github.com/linaro-swg/optee_examples.git"
> +SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
> +           file://0001-make-Pass-ldflags-during-link.patch \
> +           "
>  SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.28.0
> 

> 

