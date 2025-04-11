Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E747BC369A9
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 09:31:09 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.21782.1744363863927315970
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 02:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e4EWJYaf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2064245f8f.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 02:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744363862; x=1744968662; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1hjlGsDGK+8nHdtzMNWwl63KwjTNu1OX113t3I9Huk=;
        b=e4EWJYafRwGzOC7IjYWzG2u5PAr+aJMiVddERdBwvdp24rYY1pSB7JlkPbunkMv4gs
         2K2L5Tb3BLxp7TupBcRgvQlYvPJiAU1ZETjRd7MGpBCLMKv0oni1nOwIVEVmNttMfqaM
         Cs6sS7OHdvGQ9rSiCTuaPvhWlqyV6RfQwmJ5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744363862; x=1744968662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1hjlGsDGK+8nHdtzMNWwl63KwjTNu1OX113t3I9Huk=;
        b=oxQns2BepF67POp3tzUlyUeTKgvZMdpE+v0Ae3YtXFtvrgTtzXjpKKTIztydeTZVZk
         ScS22fSN47IY54yWvKZ4WAlqZeZJaSZXbMm1Euo7ByOvDlFOAAFO1rXB73VedZ5g+ahk
         E2YqaXQxypIUXCKrKNe6eD+pljMwTV75XMgct996WnrZvBNN25yI5SyrjYSCuApEpbHz
         haEhcT8lMzwHY7ZQdZTVX1fSKjATZZUYYaiG0oWtZcBsSsO0DlZKV+UIcwbbct0z5Xex
         83tTlhVqcPI4br3FIV2bFO/86OWMT0Bq7fiPvBEqh2nBJdCoTIgB3XkKpoqdVjD3AoCA
         /gfw==
X-Gm-Message-State: AOJu0YxbI3ubMg4qWeI1ATy+Zu+nQX3OLG/OQBxJJGFECH8TwvmjEutk
	iL1B0E9cJ6FUMlWJotyMUnVobk034NfJ+Nu2KmiYDDPRM80uGyqRkdf029g0KNq4BoAFJt7KXxO
	j
X-Gm-Gg: ASbGncuOIaZSgneo/XtzrpgFS/ZxZ9ZuOIcIoOWJ+/8rXpa+HKtJp5Ox5abuYH6NIlJ
	DNFiO4oxRnAmY0fY6Y8aSNX9ud0BUKUOqVSgjZ/Cw86V5H0C/QRbIrq3Y1vmZT6H4HMZVcESszI
	cZ+4oVj85BwPihX3/TcXmxz8yu+B4FtpNYK4/W4JS2t4HjO+58r0oc4etMf3bIsF1uQh9AI06ui
	/HsO4oNyOgvT78lane3DH4S9EQILf1X67/PsZdER7eRTLa0AqrWGuSggrNJcH0Z4C/CDlMKmece
	b5l1bpBZwM7NLKVSOQYDcanJ7g2VQx1w78LoegjI/qM6+/ibE1p8nBmNGUlAUJ8eWR9DjA==
X-Google-Smtp-Source: AGHT+IFVrW9jLB3ojvbFLRTLbvJID4+IHE7IZYXetyWHiynqcIRWV4O6pud0hnRlO8I0XYr7+ObqgA==
X-Received: by 2002:a5d:584b:0:b0:39d:724f:a8f0 with SMTP id ffacd0b85a97d-39eaaebb54fmr1309388f8f.42.1744363861716;
        Fri, 11 Apr 2025 02:31:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1556:e863:7570:d375])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c824bsm77667085e9.24.2025.04.11.02.31.00
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:31:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] classes/tfm_sign_image: Fix assignment whitespace
Date: Fri, 11 Apr 2025 10:31:00 +0100
Message-ID: <20250411093100.3753172-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 09:31:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6459

Fix whitespace to avoid a warning with newer bitbake.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-arm/classes/tfm_sign_image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/tfm_sign_image.bbclass b/meta-arm/classes/tfm_sign_image.bbclass
index 24df7682..44ef3318 100644
--- a/meta-arm/classes/tfm_sign_image.bbclass
+++ b/meta-arm/classes/tfm_sign_image.bbclass
@@ -33,7 +33,7 @@ DEPENDS += "trusted-firmware-m-scripts-native"
 
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES to the
 # right path until this is relocated automatically.
-export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
+export OPENSSL_MODULES = "${STAGING_LIBDIR_NATIVE}/ossl-modules"
 
 # The arguments passed to the TF-M image signing script. Override this variable
 # in an image recipe to customize the arguments.

