Return-Path: <radian.dc@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A935ACF6493
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 15:54:45 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.15978.1727538881812134102
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 28 Sep 2024 08:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MyJVnJk6;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: radian.dc@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cc84c12c2so1670937f8f.3
        for <meta-arm@lists.yoctoproject.org>; Sat, 28 Sep 2024 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727538880; x=1728143680; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9+8pTZQDM+/lnuEnET7cKJqfI9elkVxeV0h8BEU2Cs=;
        b=MyJVnJk6YswQAO8/1GUcaFiCeqcXXnbtlydShzUZB3SOz5mrbtDzRHh30ySKeNHzsy
         NL/jbrM4DPVoMuat5Y8LmtRkkCiUSQSV7NptXo3MKnKP4zpYHByudysTJ89e837AezPM
         xDGwheJwi/sG+RQ509KhmD6b8OrA7xQfVfM8Gww8/wvvt+49OCidDGv2E7bu8BlwScbb
         8JLr3q0Z915mfuPntXI0ZViCsQptEpvnUReoZLN77gWKGLhuG8zuuP5Krw5MhhuVtu6s
         MdMr+80jkA9WjtaUixutGNEmenRfKSXwznN4YXTYR4DxEq6hxKc/9iBp1B47SnjmnoFD
         OrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727538880; x=1728143680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9+8pTZQDM+/lnuEnET7cKJqfI9elkVxeV0h8BEU2Cs=;
        b=nBlkjbfUScfcpfrMvFlwOTemmNOVtoYrJf8/JPt8yx87gMOzReN/gCgIrty3HWE2Er
         Gx+v3CvmcOLOsTm6MfsSzC3ln0zfcHMygaceDWxIotwJ+1StJZdIhmckqr/EQGVAPEvg
         dAcLR4+aXuDgQR6QACA2OuJq5QJiT+OFZA1SbjNuP0es9TTNPUGqO2hhGvao71uaxSOT
         R9oxElCAd6Hhy8bb8xEAfmWf1LWURt/Va7XDQ0O0z9rbUjxufV1QAfs62Om/0rWNQLm+
         PzjPCk1xhgX7pbZ4RiC9s/C3tcJdfhgEKCbohJ6O1niJXuTWLF5mkQGG6rvxMnpQ0tRf
         a+7Q==
X-Gm-Message-State: AOJu0YwU28yi+n3ovzDEQJUK6kmdcHYJqc5j74x01RuqgusqOebJKPwA
	4ISvfB+Z0JUFigC6XQEQ9npqFy0L+85nxh4ilPGVrtZioGxlSAsZ7kZYi+Tc
X-Google-Smtp-Source: AGHT+IHEKDu+vi/AAU2CMRTa9QSN7R3aY5kwzPJ3+LQt94/yLHiUVq90fgOeHK9vpzOZNz46o7DiNQ==
X-Received: by 2002:a05:6000:cb:b0:371:9121:5643 with SMTP id ffacd0b85a97d-37cd5a99fd0mr4240516f8f.12.1727538880107;
        Sat, 28 Sep 2024 08:54:40 -0700 (PDT)
Received: from dell-f2yjyx3.. ([185.32.209.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5742602sm5115370f8f.94.2024.09.28.08.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 08:54:39 -0700 (PDT)
From: Adrian DC <radian.dc@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>,
	Jon Mason <jon.mason@arm.com>,
	Adrian DC <radian.dc@gmail.com>
Subject: [PATCH] trusted-firmware-a: fix build error when using ccache
Date: Sat, 28 Sep 2024 17:54:36 +0200
Message-ID: <20240928155436.1145975-1-radian.dc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 28 Sep 2024 15:54:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6137

From: Javier Tia <javier.tia@linaro.org>

When ccache is enabled trusted-firmware-a recipe fails with this
error message:

    make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.

ccache prefix CC variable with 'ccache' word before compiler. Because
there are no quotes assigned to CC, only 'ccache' is assigned. The
compiler becomes a make target, producing the build error.

Add single quotes to LD is a good measure to prevent this kind of error.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
Signed-off-by: Adrian DC <radian.dc@gmail.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 2e3b50c5..5d3da59b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -101,9 +101,9 @@ def remove_options_tail (in_string):
     from itertools import takewhile
     return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string.split(' ')))
 
-EXTRA_OEMAKE += "LD=${@remove_options_tail(d.getVar('LD'))}"
+EXTRA_OEMAKE += "LD='${@remove_options_tail(d.getVar('LD'))}'"
 
-EXTRA_OEMAKE += "CC=${@remove_options_tail(d.getVar('CC'))}"
+EXTRA_OEMAKE += "CC='${@remove_options_tail(d.getVar('CC'))}'"
 
 # Verbose builds, no -Werror
 EXTRA_OEMAKE += "V=1 E=0"
-- 
2.43.0


