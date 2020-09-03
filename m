Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.5188.1599099800528090375
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 19:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=S4sNQuPW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id ef16so622679qvb.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2020 19:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y4ujwMMiY8fWYEMnvCjBJGTkFipciVVb2WfSKTdrdbU=;
        b=S4sNQuPWLfvGdZQ3JyEUkW1GJs6S0DobbE4HwxBrz9Nuk3e1LVkxY9gsvQvd+izP46
         koztVr5Q7PV4/bljC2D3NUqgiVFH+uWYyqpxFQOzOqNC6H7+XTAuLKK7GQr2vzT3jF3f
         M55uI/lg/fjhTmq0y4fcBfWBVWVSHEGYasgtnvd0k9j0CTtUinITvjCMA/lZIEMuOLlG
         Mf5r5CmowCDrsl900Ooo/SPoFNggbfYzjl/oK9yCcE0Rn3BhTQfUWsKuwIa7j4XDDrAU
         19IhvcYUsCsMqmY+7YzrenXqcBgnuVF1C8DlzzxKgfibefWmlgDNxOH5Ym2HVc/ZVd2I
         RMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y4ujwMMiY8fWYEMnvCjBJGTkFipciVVb2WfSKTdrdbU=;
        b=llakqJhGDzKfWh1BLvsCyPj46nvc8qD9FYUW2T2bUartV2tCYI/Y4jjWOSIcnQPt3n
         BNoOX0GiTDe0d4HNOHXVJdS1KSK0Ul0zXYF3oPwnfxszLGCsVbYYgy9cCC3JPnxM6ja0
         dBB4LUUz5eJ7mgwBz0pSS4w3/VtJExSTkj2/wfzXnGi4WbcAs5am41YDYVV8A3PirSDg
         fZdRCNXEzP1GOug2yxlxRbmq8xwY8MIPgh0M5ocZMXKZiNd1u6hJJSSkPub5LD1wCmqK
         4fcpnlOICqka5VWIHWeCDw++9OzS+Jguh1gkya50QQz3ojLdTB0GcA26jUPOpLitTyhi
         5WdA==
X-Gm-Message-State: AOAM530Z+F1YrIaTC4GGBI/TFKa7nNmCBJcLbgIewP+bcVoVkjteR7SF
	VyaiceycvisGOIJRnldS++tHWQ==
X-Google-Smtp-Source: ABdhPJzM9kjwiIZehUWgqXIDOxYLKOGKD9cgYfNc/6HDqBsmjEuY5LEAHB1KWjy9/7PyFoGAkl7/cA==
X-Received: by 2002:ad4:5764:: with SMTP id r4mr819931qvx.73.1599099799680;
        Wed, 02 Sep 2020 19:23:19 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id b187sm1146444qkd.107.2020.09.02.19.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 19:23:19 -0700 (PDT)
Date: Wed, 2 Sep 2020 22:23:14 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v2] optee-examples: Respect LDFLAGS passed via environment
Message-ID: <20200903022314.GB31845@kudzu.us>
References: <20200902061910.2082116-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200902061910.2082116-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 01, 2020 at 11:19:10PM -0700, Khem Raj wrote:
> This ensures right linking flags e.g. gnu_hash settings
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Pulled into master.

Thanks,
Jon

> ---
> v2: Improve patch commit message
> 
>  .../0001-make-Pass-ldflags-during-link.patch  | 103 ++++++++++++++++++
>  .../optee/optee-examples_git.bb               |   4 +-
>  2 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
> 
> diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
> new file mode 100644
> index 0000000..0894a7a
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
> @@ -0,0 +1,103 @@
> +From 29ae21de41f2fbab6dbecbbf408826b28de82df1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 1 Sep 2020 21:09:56 -0700
> +Subject: [PATCH] make: Pass ldflags during link
> +
> +OpenEmbeeded needs to pass essential linker flags to set correct flags
> +for gnu_hash among others which sets the linking straight
> +using LDFLAGS varible here means, we can affect the linker flags
> +from build environment
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

