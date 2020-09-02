Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.1346.1599027556030355371
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Sep 2020 23:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O1tnor+W;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id q3so1791353pls.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Sep 2020 23:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RB33+C4E20bNUizY84gIz1KELh9fhOV7iZAnyhyrgDk=;
        b=O1tnor+WaAioZlYcXZ5KjYPZpzcrwuRjv/3zaRPG5z4eGGo5fHhDePiLptQ5L6mkGg
         YrRvQUe9Z3dJj95ehVcGBjh6szFWm/fCuOXrcwQca5kdpM67p0v6TbkuRUE8RgHN+1o0
         En9qlmcr++juSyORILYt+tPx6+2dzEc09qQPLk48PLQjRHvowqKNKIvmdR7DJOQLE/7k
         5kXPCm5Fv/2ttTMpjKHCtqNDvLVqGG4X0Z2J0P6wCDR/HXsYBMVyKN+NqmEsbmYNFDnH
         l1aD5epaZGQsoQKuei80VtmY6eflBoEJnxaNep4LKQ5kAO876EXtZBD9TC5agcfawWp9
         +2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RB33+C4E20bNUizY84gIz1KELh9fhOV7iZAnyhyrgDk=;
        b=G+/+X8wYeNkSRjuOq4EkYntE8UMwtK5nI/H/ZBSHA0eILpeKNgI9Xv1IEmg4GRBFtB
         xmWhXEWCl0Hprd/xGlDHueTIAgMzWFKvrk0gZ1dAR7w0757RbHivRjYIljWqxiqJKxuE
         aSfMU0Kv1JvsyKR73nSpRPIyH1WfJqq4oZHJCYGbIuNd04VTlxhiNN8/wAweTO0dm8Dg
         RyKe9Os2Iwpocxa8kXIJgFLp7m4U9AYpMS+ksZUbqNmzIxGg0a9N0TpkMDGCGFrOX9Wm
         kYt/VTPFQ+raYOyRG8HU9KRJ3Z9u1ECb52VPjf0zMary1aSyh1P6wVMUXODI2Udvhfo+
         LiyQ==
X-Gm-Message-State: AOAM53094KG3aOa3Cd/xnimPXkInOBO3KsgWpwAIENsNFqup72WIoYl5
	uHa+FlU+zuGw64aFJTxO0x8GoUmP3/uXrw==
X-Google-Smtp-Source: ABdhPJxvYjNGqigdBXVb6MaSj8usgZaZmOCRwXM2oE2acA/Y5d2yAVpKFkk5DR9rxMM/sb4pI2s36g==
X-Received: by 2002:a17:90a:9415:: with SMTP id r21mr875003pjo.204.1599027555046;
        Tue, 01 Sep 2020 23:19:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id y65sm3971414pfb.155.2020.09.01.23.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 23:19:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] optee-examples: Respect LDFLAGS passed via environment
Date: Tue,  1 Sep 2020 23:19:10 -0700
Message-Id: <20200902061910.2082116-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures right linking flags e.g. gnu_hash settings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Improve patch commit message

 .../0001-make-Pass-ldflags-during-link.patch  | 103 ++++++++++++++++++
 .../optee/optee-examples_git.bb               |   4 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch

diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
new file mode 100644
index 0000000..0894a7a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
@@ -0,0 +1,103 @@
+From 29ae21de41f2fbab6dbecbbf408826b28de82df1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 1 Sep 2020 21:09:56 -0700
+Subject: [PATCH] make: Pass ldflags during link
+
+OpenEmbeeded needs to pass essential linker flags to set correct flags
+for gnu_hash among others which sets the linking straight
+using LDFLAGS varible here means, we can affect the linker flags
+from build environment
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

