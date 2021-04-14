Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.13166.1618408080774136565
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 06:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=nRNaDP91;
 spf=pass (domain: blade-group.com, ip: 209.85.128.52, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f52.google.com with SMTP id t14-20020a05600c198eb029012eeb3edfaeso329031wmq.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Apr 2021 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0dKd9wfeyxJaah+VqTGhPH7FxdM3978Vcs79rAfkIOs=;
        b=nRNaDP91yTB0eyoX6XNkdJZJuDQYIAJ6vlcjvuu5skFBvkHguZmmB61UiReR/qGpcr
         T4NOIiOAsffUV04qmf6+y82L5BO41h51xi3OXuDvkTZcefINuKj7wq28B+iM2sFFGxHq
         maeAsaAhms1Y5r4GRuy2tAOdUOpcuTggwJgKx1xyg3APP8KaENdNUyJ7Z4588Nv3PAmA
         XYSchuXZqi38/orzOY4r4/DRxm1vGUnOUS3j1PWYdkWIgxBGlPCi+rsjGHoeI8q15TMs
         mrBRJmayFq9ZYbU3e01fbLsJR/+TdovADnHa/IwpAU9RyRbG7l3CmLDdmvVu7tlSRv3h
         mnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0dKd9wfeyxJaah+VqTGhPH7FxdM3978Vcs79rAfkIOs=;
        b=gZMBFEMaofo41IRHpBu7Lod8OAc+mYlqSyW0jAKua6jDdkLIWDA6/OzYCtJb/S+lfG
         qHrFQn3bH6j+pIaRfGqbglsl3TIfm+P+b7mdA/0PereATqugbEvQBWjd3ItROiCf+AE+
         6NaRNB14KnDRym54FqWAOF87WB2zzDFzBiFClWweOiXEXh5LMuZTQB/ahKKJxzJfTCQU
         wXhHo/DNqhvzyz6jpD0dWbo94909ERlU7D/eCT8nUWBvzTAeZkQymbWWXUnBlQtHl3+A
         fE4dzS89R1V82/nfMfBBfnCembXtatiDVjL7sV008AfSs76BenpBpv0DRN5Nfnx6Kc05
         i3Rw==
X-Gm-Message-State: AOAM531kMqC4yi929CbJdSd8llZQG9XMa9MCkU04Dp+f5u7omR14j4nh
	qKpdbfc8lntJjsy/m5dgCpVoYhk2sdtCEg==
X-Google-Smtp-Source: ABdhPJy7pawMxR27h8oVV3/VvR8f/KJiZtPL7YChL51PsBYdxLvyF/Q8x2U2mBQewrf2I9IEMGT9AA==
X-Received: by 2002:a7b:c92f:: with SMTP id h15mr3134219wml.88.1618408079302;
        Wed, 14 Apr 2021 06:47:59 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q20sm5517551wmq.2.2021.04.14.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 06:47:57 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 0/6] improving OP-TEE support for u-boot-based platforms
Date: Wed, 14 Apr 2021 15:47:20 +0200
Message-Id: <20210414134726.4125294-1-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

While working on integrating OP-TEE on rk3399 with a readonly rootfs,
I figured that a couple of things would be good to have in the optee
recipes.

Also, having started to work on old meta-linaro/meta-optee initially:
 - I had to duplicate some of the work done here and had submitted a
   similar patch upstream
 - pycrypto simplification became obvious

Changes from v1:
 - Denys' Reviewed-by in patch 1
 - include tee.elf in do_install rather than do_deploy in patch 2, as suggested
   by Denys (but wondering whether optee-os-dbg would not be the suitable
   place for all of those files, rather than the main optee-os package)
 - simpler downstream example in patch 3 commit message (thx Denys for
   the suggestion)
 - patch 4 completely replaced as suggested by Ricardo
 - new patches 5 and 6 trying to clarify and cleanup LOG_LEVEL issues

Yann Dirson (6):
  arm/optee: use pycryptodome rather pycryptodomex
  arm/optee-os: mark LDFLAGS patch as submitted
  arm/optee-os: deploy tee.elf for u-boot
  optee-client: use /var/lib/tee instead of /data/tee for persistent
    storage
  optee-os: don't override upstream TA_LOG_LEVEL setting
  RFC: optee-os: provide a "debug" PACKAGECONFIG flag

 meta-arm/recipes-security/optee/optee-client.inc         | 5 ++++-
 meta-arm/recipes-security/optee/optee-examples.inc       | 2 +-
 .../0001-make-Pass-ldflags-during-link.patch             | 2 +-
 meta-arm/recipes-security/optee/optee-os.inc             | 9 ++++++---
 meta-arm/recipes-security/optee/optee-test.inc           | 2 +-
 5 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.30.2

