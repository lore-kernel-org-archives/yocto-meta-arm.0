Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C982C369BF
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 10:04:36 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.12207.1727258667892233838
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 03:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oZHfMGgM;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53654dbde59so707795e87.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 03:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727258666; x=1727863466; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXKWUiR9GbmvEYnOa70X8ma4apazh5Rwws/j4fWH7fk=;
        b=oZHfMGgMg0bDlOPkPx1Jg0KHyAhNOoKv0/BAAkybuWmDlY2AgDMeie8j4HnXONTcp3
         QrRHhM7V0/nTz2hF/I2I4DwvpvzLoLnA4DTWj/udULqqaS1TA0+1czt+rLlbNtI1df9i
         jNYtnS38dUBpxMsyppTeD7H9mM2HxrAtY/F9oBGT+F4aibFne/xrmoyuNj8dVewmhWJO
         AwzOuDHJDarbOVe8dwRqdYolokS1ij9ckb9uUxKRr2OHjZgKpFf7H1avOFHaGYAXsmYX
         ZS8ZUqXkaUFwOeCphl91m3REQYnENiSRtic0WFOlqrqQ97R2pK276rt7Qd1dx45MKQZR
         eQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258666; x=1727863466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXKWUiR9GbmvEYnOa70X8ma4apazh5Rwws/j4fWH7fk=;
        b=F9pj+SaEAP+YRviz8JlD21m/o7xsUi1vPGpTWzL6X+N9t8j7DXINS4BpNkrHq9teI5
         LnrRuINdjPCB642bdooO3sUPCDvt8TFtMTru4mUF2OhqLBQ74LBM+sFXl/twmMyBD95w
         jXfn+GiQOyjR3hVWV9dYudfuCPl6lKJZqN7z/M/2Gg9AkhhqAmM5BLAjuRrEzLODx8rU
         Zj0+dwGdgW6uOOEDMnsQIxq32yddwjLOev8fgdWmJAR1jomJz1RcHspDj/ZengJQiAFA
         oFJWnD8zfe9f5QRFKba2xrgRtSkMGFE4QVtEkmwC3CQwCAFcVko4I9nU93o4LOgFoZKl
         aOvg==
X-Gm-Message-State: AOJu0Yw6CTAa06KisFYb6Sm+3x8G/C0/Ir+M3sPkgVJmsIOODeho3BeQ
	huJ7gG/mO+6DRuwk6c5TjHS7ifF0AhHQrV7wvB0m4CT84ntIkNaBfx6hbl5G6r2k6YH88K9D38G
	hVl8=
X-Google-Smtp-Source: AGHT+IFiKZHtU/dMIlcWb+71rIpGourle4K3XZdONlDh1qfx2qbjKDcBD6NQWVRZrelKDLN7Hjfdag==
X-Received: by 2002:a05:6512:1096:b0:52c:dc06:d4ad with SMTP id 2adb3069b0e04-538511734c1mr714071e87.6.1727258666015;
        Wed, 25 Sep 2024 03:04:26 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d9d9sm478631e87.253.2024.09.25.03.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:04:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 0/4] optee update and systemd service changes
Date: Wed, 25 Sep 2024 13:04:10 +0300
Message-ID: <20240925100414.73073-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 10:04:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6108

We discussed these updates over separate thread but here's the set
of changes to master branch which update optee to 4.3 and fix issues
around udev rules and systemd service. New in optee-client 4.3 is
support for systemd sd-notify which reports tee-supplicant startup
correctly to other services which depend on it. I tried to adjust
the optee test timeout based on upstream CI test execution times.
Hopefully this helps. Tested on qemuarm64-secureboot and
qemuarm-secureboot.

v2: Type=notify in service file since sd-notify is now supported

v1: https://lists.yoctoproject.org/g/meta-arm/message/6102

Javier Tia (1):
  arm/optee: Add optee udev rules

Jon Mason (1):
  arm/optee: update to 4.3.0

Mikko Rapeli (2):
  optee-client: fix systemd service dependencies
  oeqa optee.py: increase timeout value from 22 to 45 minutes

 meta-arm/lib/oeqa/runtime/cases/optee.py      |  2 +-
 .../recipes-security/optee/optee-client.inc   |  8 +++-
 .../optee/optee-client/optee-udev.rules       |  6 +++
 .../optee-client/tee-supplicant@.service      | 11 +++--
 ...-client_4.2.0.bb => optee-client_4.3.0.bb} |  2 +-
 ...mples_4.2.0.bb => optee-examples_4.3.0.bb} |  0
 ...it_4.2.0.bb => optee-os-tadevkit_4.3.0.bb} |  0
 ...not-use-full-path-to-generate-guard-.patch | 45 -------------------
 .../{optee-os_4.2.0.bb => optee-os_4.3.0.bb}  |  3 +-
 ...stats-remove-unneeded-stat.h-include.patch | 34 --------------
 ...ptee-test_4.2.0.bb => optee-test_4.3.0.bb} |  4 +-
 11 files changed, 25 insertions(+), 90 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client/optee-udev.rules
 rename meta-arm/recipes-security/optee/{optee-client_4.2.0.bb => optee-client_4.3.0.bb} (71%)
 rename meta-arm/recipes-security/optee/{optee-examples_4.2.0.bb => optee-examples_4.3.0.bb} (100%)
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_4.2.0.bb => optee-os-tadevkit_4.3.0.bb} (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch
 rename meta-arm/recipes-security/optee/{optee-os_4.2.0.bb => optee-os_4.3.0.bb} (77%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-xtest-stats-remove-unneeded-stat.h-include.patch
 rename meta-arm/recipes-security/optee/{optee-test_4.2.0.bb => optee-test_4.3.0.bb} (78%)

-- 
2.34.1


