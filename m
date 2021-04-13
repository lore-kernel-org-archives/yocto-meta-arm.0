Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.6773.1618306865626609306
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 02:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Jspk0Q1w;
 spf=pass (domain: blade-group.com, ip: 209.85.128.43, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f43.google.com with SMTP id g18-20020a7bc4d20000b0290116042cfdd8so10277326wmk.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Apr 2021 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6QS3KhSjn6NeioPuvFob+SXBe0jimKERNa2cRK7A01Y=;
        b=Jspk0Q1wFPMLnGJy4LbaWRbZdh86q5gXw3kfwergcK1wfCu+5Dp3ZYCyyST19pBHwr
         4EiFOPR33CxBdZUYcW4uSm8KB9XDBpTwIRsDM2ZhHf0t3SykTczLSUFgmw+TO5wiTDw3
         a1zgCh+OMpyw4zRCABh4CYe79RL/YEoTEMZjn4LniRz2Kg20NcbdzgCPeEOxBxqgnJyd
         ip3X63GxPXZYPGOMXu+S+ZPbu2rrf2YkXYOm1wXxzqHbcJLG6YCXiR24z0S/v7v/E8bd
         6J9T/6yfBrvWPUalyCVBeDLA6rrrFc04y8VKsJdNYB7DZ2jeo3NC250hz3Io2XsRUQdu
         CBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6QS3KhSjn6NeioPuvFob+SXBe0jimKERNa2cRK7A01Y=;
        b=hA054jXXXH2uhmzyx8peYy+5ftV2TW4wnhG8IGZmux+VSPexxCgmMJFEqYNFYrw4hH
         p1qooAkEbOkAWMtltOgb5RPPFVCQuKKfNUU+RgXA5A7C6cNsNmTWBhyQiprI5D1MmvEM
         l61z7SL5aBV8nD+ij6lmzMzo8e6sEHChbui6Yhr10Q9Fyx5hnJmKJmfX2bxjD9NrQ5mp
         pkk9STTts+9QAn9WUeIgOba4ymSlHMogipWZPh9trf9VQmVMNWydkoroSGXa/4onejxY
         t4XfE5B9KTQExWwIKC9zneOftwMut7gujUyF7vUIEymVTIO/k6MIvVReTDqJpHKmNJpx
         qK7A==
X-Gm-Message-State: AOAM530JpwUNgqBWOZ9XwaAstAiqDVoavF5wqxz9k6yh+DJUfYAonVgP
	uP84c5CmPyX+gvuDvdBop63w5aTvjuXbCQ==
X-Google-Smtp-Source: ABdhPJxjvCdAGzBC+p04LWHNXsPfUoMZiExL8Wr/CxJhKuCBaolp7eK9wAcVuSS+9o2Y4ki8ovgBDQ==
X-Received: by 2002:a7b:cc10:: with SMTP id f16mr3112906wmh.131.1618306864110;
        Tue, 13 Apr 2021 02:41:04 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id g12sm10544145wru.47.2021.04.13.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:41:03 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 0/4] improving OP-TEE support for u-boot-based platforms
Date: Tue, 13 Apr 2021 11:40:34 +0200
Message-Id: <20210413094038.3577754-1-yann@blade-group.com>
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

Yann Dirson (4):
  arm/optee: use pycryptodome rather pycryptodomex
  arm/optee-os: mark LDFLAGS patch as submitted
  arm/optee-os: deploy tee.elf for u-boot
  arm/optee-client: create the /data/tee/ directory needed by
    tee-supplicant

 meta-arm/recipes-security/optee/optee-client.inc            | 6 ++++++
 meta-arm/recipes-security/optee/optee-examples.inc          | 2 +-
 .../optee-examples/0001-make-Pass-ldflags-during-link.patch | 2 +-
 meta-arm/recipes-security/optee/optee-os.inc                | 4 ++--
 meta-arm/recipes-security/optee/optee-test.inc              | 2 +-
 5 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.30.2

