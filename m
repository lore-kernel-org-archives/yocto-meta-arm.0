Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.14135.1599020369599063313
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Sep 2020 21:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lhV4Oi2C;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id q3so1662583pls.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Sep 2020 21:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GXTpPztZFOhQELtKKZOwVB1cl8hqM2+mPKuQ47FUZY0=;
        b=lhV4Oi2CPX8bkQrtYMq7G7IeI7QUK7IBxfg+IMnoqpkOaRudqGKpRW0vUqWo+cfwee
         geKJlKIEkPgysN4mDJkEBguNkwl6wBvMbImRuCahTxTgU1GJxzjPhP5mCBaPCd2g+GoP
         tsAigYGswoozALXP7tjzPh2Q018a5JjQt4/YowlVMfou+dor297XZKdsmdgiTf1N251B
         DUZnV3znLu0Q+VfUeO6IkHTbI9cmhlF4/XOMXSyrXhtkVvQSSZJbDbvyNjjj7BqWsid0
         uMK3bPWOoSarTSprK7oFkgLexLPPCuuGlzuNB2D2S56sl3hUXSsl7tO4F+Tcyhtb/TBy
         U7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GXTpPztZFOhQELtKKZOwVB1cl8hqM2+mPKuQ47FUZY0=;
        b=CzVmfRKklzOax0PPsorr7PIdxicqRq8YAtvfVySQrZTEmYdxG8Phs1SQcygHOJaqgP
         6GrqEC+9p8+iiIPh3qrQiirAd5IcVnUfA+zu8G5ZaJlSSNs2qLjeqTjs/8zX79iUC9yj
         qDZQSH+jlHMA3bxZudfU0ShbuvhnNeKnkN/Oa4q6CTdRIbDaLYOMUV3ylLAOTynBStNV
         ZtJ1dqrLswaKgyim2xRiv/1fI/b0FMqf+r75VmhQDurnlFMrZv74A/QUYqerxhD4a6np
         NOfYYQBXEmk0nguFF8PeWfSzwmnc1SJpcawuQB1pMKQd2uyjmBPv77r1fT29paAiwZ4/
         1syQ==
X-Gm-Message-State: AOAM530PpFLYT24VpZFLYof5pUb0ZkOhh8qiIcRsmtdj5t/6jT5Dsm2Y
	WWOX5tYqr4JIMdtopJ1bSEB+Nu0oQCbMFw==
X-Google-Smtp-Source: ABdhPJzHerXHpZ5UdGegJ+AVBH3J9jAR827StU1fVJnOCy/JQktr6Nke+Z23h02rf0JyIoSN/KYDsQ==
X-Received: by 2002:a17:90b:1b47:: with SMTP id nv7mr535615pjb.128.1599020367793;
        Tue, 01 Sep 2020 21:19:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id x185sm3690447pfc.188.2020.09.01.21.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 21:19:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee-examples: Respect LDFLAGS passed via environment
Date: Tue,  1 Sep 2020 21:19:18 -0700
Message-Id: <20200902041918.3645954-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures right linking flags e.g. gnu_hash settings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-make-Pass-ldflags-during-link.patch  | 102 ++++++++++++++++++
 .../optee/optee-examples_git.bb               |   4 +-
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch

diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
new file mode 100644
index 0000000..1a8d630
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
@@ -0,0 +1,102 @@
+From 29ae21de41f2fbab6dbecbbf408826b28de82df1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 1 Sep 2020 21:09:56 -0700
+Subject: [PATCH] make: Pass ldflags during link
+
+OpenEmbeeded needs to pass essential linker flags to set correct flags
+for gnu_hash among others which sets the linking straight
+Not using this vasibale means, we can set the knobs via Make environemnt
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ acipher/host/Makefile        | 2 +-
+ aes/host/Makefile            | 2 +-
+ hello_world/host/Makefile    | 2 +-
+ hotp/host/Makefile           | 2 +-
+ random/host/Makefile         | 2 +-
+ secure_storage/host/Makefile | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/acipher/host/Makefile b/acipher/host/Makefile
+index 8f4bc8a..c2cabef 100644
+--- a/acipher/host/Makefile
++++ b/acipher/host/Makefile
+@@ -18,7 +18,7 @@ BINARY = optee_example_acipher
+ all: $(BINARY)
+ 
+ $(BINARY): $(OBJS)
+-	$(CC) -o $@ $< $(LDADD)
++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
+ 
+ .PHONY: clean
+ clean:
+diff --git a/aes/host/Makefile b/aes/host/Makefile
+index dfeb4e8..f61c71b 100644
+--- a/aes/host/Makefile
++++ b/aes/host/Makefile
+@@ -18,7 +18,7 @@ BINARY = optee_example_aes
+ all: $(BINARY)
+ 
+ $(BINARY): $(OBJS)
+-	$(CC) -o $@ $< $(LDADD)
++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
+ 
+ .PHONY: clean
+ clean:
+diff --git a/hello_world/host/Makefile b/hello_world/host/Makefile
+index c4c8239..69cf42c 100644
+--- a/hello_world/host/Makefile
++++ b/hello_world/host/Makefile
+@@ -18,7 +18,7 @@ BINARY = optee_example_hello_world
+ all: $(BINARY)
+ 
+ $(BINARY): $(OBJS)
+-	$(CC) -o $@ $< $(LDADD)
++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
+ 
+ .PHONY: clean
+ clean:
+diff --git a/hotp/host/Makefile b/hotp/host/Makefile
+index cb7fd19..e7f013f 100644
+--- a/hotp/host/Makefile
++++ b/hotp/host/Makefile
+@@ -18,7 +18,7 @@ BINARY = optee_example_hotp
+ all: $(BINARY)
+ 
+ $(BINARY): $(OBJS)
+-	$(CC) -o $@ $< $(LDADD)
++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
+ 
+ .PHONY: clean
+ clean:
+diff --git a/random/host/Makefile b/random/host/Makefile
+index fd407d9..9377f7a 100644
+--- a/random/host/Makefile
++++ b/random/host/Makefile
+@@ -18,7 +18,7 @@ BINARY = optee_example_random
+ all: $(BINARY)
+ 
+ $(BINARY): $(OBJS)
+-	$(CC) -o $@ $< $(LDADD)
++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
+ 
+ .PHONY: clean
+ clean:
+diff --git a/secure_storage/host/Makefile b/secure_storage/host/Makefile
+index 29bfb87..b3265ae 100644
+--- a/secure_storage/host/Makefile
++++ b/secure_storage/host/Makefile
+@@ -18,7 +18,7 @@ BINARY = optee_example_secure_storage
+ all: $(BINARY)
+ 
+ $(BINARY): $(OBJS)
+-	$(CC) -o $@ $< $(LDADD)
++	$(CC) -o $@ $< $(LDFLAGS) $(LDADD)
+ 
+ .PHONY: clean
+ clean:
+-- 
+2.28.0
+
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_git.bb
index 04cc5fd..71be593 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
@@ -13,7 +13,9 @@ inherit python3native
 
 require optee.inc
 
-SRC_URI = "git://github.com/linaro-swg/optee_examples.git"
+SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
+           file://0001-make-Pass-ldflags-during-link.patch \
+           "
 SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
 
 S = "${WORKDIR}/git"
-- 
2.28.0

