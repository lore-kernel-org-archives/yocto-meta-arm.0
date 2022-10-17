Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA001C43219
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 21:01:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.1780.1666040508051072443
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 14:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=utYQIB6S;
 spf=pass (domain: linaro.org, ip: 209.85.128.49, mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f49.google.com with SMTP id n9so9469171wms.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 14:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r0mO+0/R2l6vUlvFET9PcI2Q+4waghaXmciZwUbLOeQ=;
        b=utYQIB6Sdrd/S+2rB9dvDIO7tP2QwjqaFD31DO8sErILe6LLjEV0hEgpRj/HWpPMp+
         vHPqKHTqWdY7R/BCBn8Vz3rq0li6vUEUUl2njSs3U1ydUIC5hHZ0RprkTtSf0sOQ6rZF
         a4JTsn2i+XhTWZfhJthoTMIbsEyVT8cU3hp2MAoH0Rk3lmQ6Ru8ziYC10sjaQYYbIKmu
         ZmWz9528DcUIimaYL3JgBhYmyE7onqpbGpL6PO3/x6/e3kf+UtPB9Fc4fcgS9QdIXiQg
         Sq2cPSbtyPNaSQjWZAhsVMWTqJkFgNhN9AkV1EhOHMxxrhriR/Z7GiXAdjkGp66BBNSN
         Uo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0mO+0/R2l6vUlvFET9PcI2Q+4waghaXmciZwUbLOeQ=;
        b=c2G5XOQG03GZXdUVjzjOh9A9OoPqdubbmxoklGdcRFAr2TrDQGw3noy+ipLyHeNNv5
         qutzMPY58RR9ZcG1TVrtee46dh0ga3fPKI3qxJZ71rcNNvP1kBXTiLjvBnouyMZ5y7lu
         L2ZrmFoeEODAi+0zCYEBP7qtT5R6W31VmC2t+hbyLHqwe6TrDhnNRl6kewZ9AfifbwwX
         d+GGrOYdJz1dPdwwMn3hDU2Ehn3T7OZsoSb378CYAvihYXjP7P6ZzuuoK0+G/qSgc/8t
         none5udJR1HqcNUibHM0KgR0b8ok5uM2CIy8kaEmG1q7VYaWQjlISUOiPDziEmqMaiyq
         dRDw==
X-Gm-Message-State: ACrzQf1/pgSgtZW+3Oz0gKd8jmtSBXlPwOXWjNqspLf0Fi9QjoSTJ6gj
	FOeH6DnbhZiQVBf9KwX78UrliZy85YK4uA==
X-Google-Smtp-Source: AMsMyM44mEFvBDFG32FQqV2c4g+r10r0vYaEbwhBLRIIbGFBV6TKmBz7nKPuoura0LRkLUkgibCQ2w==
X-Received: by 2002:a05:600c:198a:b0:3c6:f6b4:68d5 with SMTP id t10-20020a05600c198a00b003c6f6b468d5mr5066566wmq.14.1666040506056;
        Mon, 17 Oct 2022 14:01:46 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b003c6c1686b10sm18091805wms.7.2022.10.17.14.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 14:01:45 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/2] arm-bsp/corstone1000: trusted services with openamp as backend
Date: Mon, 17 Oct 2022 22:01:34 +0100
Message-Id: <20221017210136.352276-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 21:01:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3975

This series, update the libmetal, openamp support at trusted
services as Secure Partitions backend for the communication
between the host (Cortex-A35) and Secure Enclave (Cortex-M0)
in the corstone1000 platform.

Cheers,
   Rui

Rui Miguel Silva (2):
  arm-bsp/optee: add log handler
  arm-bsp/trusted-services: support for libmetal and openamp

 .../0004-Handle-logging-syscall.patch         |   33 +
 .../optee/optee-os-corstone1000-common.inc    |    7 +
 ...1-Add-openamp-to-SE-proxy-deployment.patch |  287 ++
 ...ver-and-the-OpenAmp-conversion-laye.patch} |   76 +-
 .../0003-Add-openamp-rpc-caller.patch         | 1196 ++++++++
 ...-add-psa-client-definitions-for-ff-m.patch |  298 ++
 ...mon-service-component-to-ipc-support.patch |  295 ++
 .../0006-Add-secure-storage-ipc-backend.patch |  523 ++++
 ...storage-ipc-and-openamp-for-se_proxy.patch |   63 +
 .../corstone1000/0008-Run-psa-arch-test.patch |   72 +
 ...0009-Use-address-instead-of-pointers.patch |  168 ++
 ...-Add-psa-ipc-attestation-to-se-proxy.patch |  266 ++
 ...d-as-openamp-rpc-using-secure-storag.patch |  163 ++
 .../0012-add-psa-ipc-crypto-backend.patch     | 2584 +++++++++++++++++
 ...ub-capsule-update-service-components.patch |  436 +++
 .../0014-Configure-storage-size.patch         |   42 +
 ...face-structure-aligned-with-tf-m-cha.patch |   31 +
 ...egrate-remaining-psa-ipc-client-APIs.patch |  494 ++++
 ...et_key_usage_flags-definition-to-the.patch |   40 +
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch |  120 +
 ...rstone1000-change-default-smm-values.patch |   37 +
 ...corstone1000-platform-to-drivers-arm.patch |   36 -
 ...wlib-memcpy-remove-optimized-version.patch |  210 ++
 .../trusted-services/ts-corstone1000.inc      |   27 +-
 .../trusted-services/ts-newlib_%.bbappend     |    6 +
 .../trusted-services/trusted-services-src.inc |   12 +
 26 files changed, 7458 insertions(+), 64 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Handle-logging-syscall.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deployment.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0027-Add-MHU-driver.patch => 0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch} (94%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Add-openamp-rpc-caller.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-add-psa-client-definitions-for-ff-m.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Add-common-service-component-to-ipc-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Run-psa-arch-test.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Add-stub-capsule-update-service-components.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Configure-storage-size.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change-default-smm-values.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0026-plat-add-corstone1000-platform-to-drivers-arm.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-newlib/0001-newlib-memcpy-remove-optimized-version.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend

-- 
2.38.0


