Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2645CC369AC
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 09:02:26 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.10985.1727254936425603151
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 02:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QxWzgCAY;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f74e468baeso71575491fa.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 02:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727254934; x=1727859734; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWPdr3I4ym9TnvV2ff2YNc9Wavu3jqdqQk/s+JXrRpQ=;
        b=QxWzgCAYnn87amICRxppWsUoDH0x+CFk0y1tJLmEEOh0JCyaFohce76YtP2L6Vr4/A
         gAN9bZz8Jk1Gu6fk3kdVu76+1qtbCcV6YPxN9qcapusbjfm0egA6YIETyTwxP8w/Xt6V
         vu4jQL7xc5mKdup+ag0JVLgPhkcPkH3S3KIYdaeZCxLXJejPSat0L24l3KGz4dyaDTcc
         fEFxk4DQmu2VI1J5Hh8QvSVWqCmnbJjsWtqGCdGB2thjxRQqNpcqwz6ltGJ/f2saMBV8
         kkto1SV9GOFRycqsWQKDJLtca+bdiaJnmV0al5//n67vHYNTddkP/MqOzEX49itdxNcz
         5L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727254934; x=1727859734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWPdr3I4ym9TnvV2ff2YNc9Wavu3jqdqQk/s+JXrRpQ=;
        b=u9vIkNTraQ6EeGcz5bf+Bub/Z1Whcf1zi3yOjVa11l5y9Q9cC3VvYx2P9Wss69L5RH
         DtbWxEaWBifobYb7sD4fMBQOTaKdi7IPmM/S/zNxUIosgRK4mZ3R90WhHW8/IIzHJNjt
         XBx83Qxm1A0je6o4CQp4aSpdOhqe78J4iYv/N1+YwOsIQJKl/lAOQ8tioyQSUMW3i3M1
         KV+XBmczu7Nk11w/gHbIgeE6R3th676o96ccq1ZYMt5w3rpZ62M90HRVPJfg3u4OaYcZ
         fTvEP6Wv7LqCasQ0rlpR84eYiA+cUiZIoX4RW3u4b+T58chHkZNkdGNmbNIv1hjgaTjS
         0oTw==
X-Gm-Message-State: AOJu0Yy+AIn6DybluN3JvaH/LZO1CPCOyuW6TKY5zUjP9HSKuA4A6xDo
	cn5vEBLLiNY6xoTYbN25uQQ8Oo9ZpfoqIA2Sf9JKM7rBgVN7jbxPBkgPC5VH3HFhdiOatNGOjxz
	mjUc=
X-Google-Smtp-Source: AGHT+IE6iL+tkx13rLk5bwCV2u3FfSSHqt2zumKmK45u/rtkG5WSO8mXSg+7GGlAC8xfMxy9Bjyxpg==
X-Received: by 2002:a2e:bc22:0:b0:2f7:5367:5c1b with SMTP id 38308e7fff4ca-2f915fdb7dfmr13637271fa.11.1727254934271;
        Wed, 25 Sep 2024 02:02:14 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289ef7fsm4686501fa.119.2024.09.25.02.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:02:13 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/4] optee 4.3 update and systemd service changes
Date: Wed, 25 Sep 2024 12:01:43 +0300
Message-ID: <20240925090147.66618-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 09:02:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6102

We discussed these updates over separate thread but here's the set
of changes to master branch which update optee to 4.3 and fix issues
around udev rules and systemd service. New in optee-client 4.3 is
support for systemd sd-notify which reports tee-supplicant startup
correctly to other services which depend on it. I tried to adjust
the optee test timeout based on upstream CI test execution times.
Hopefully this helps. Tested on qemuarm64-secureboot and
qemuarm-secureboot.

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
 .../optee-client/tee-supplicant@.service      | 10 +++--
 ...-client_4.2.0.bb => optee-client_4.3.0.bb} |  2 +-
 ...mples_4.2.0.bb => optee-examples_4.3.0.bb} |  0
 ...it_4.2.0.bb => optee-os-tadevkit_4.3.0.bb} |  0
 ...not-use-full-path-to-generate-guard-.patch | 45 -------------------
 .../{optee-os_4.2.0.bb => optee-os_4.3.0.bb}  |  3 +-
 ...stats-remove-unneeded-stat.h-include.patch | 34 --------------
 ...ptee-test_4.2.0.bb => optee-test_4.3.0.bb} |  4 +-
 11 files changed, 24 insertions(+), 90 deletions(-)
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


