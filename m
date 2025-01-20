Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75125C02188
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 03:42:39 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.29938.1737344550537084707
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 19 Jan 2025 19:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=FSRTxUJB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6f1be1daeso394423085a.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 19 Jan 2025 19:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1737344549; x=1737949349; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLtSa6qx1Q61Nceuhdk/ga17TrUc0F11jZYjzTTSq5c=;
        b=FSRTxUJBkBFz03nK6r+cAo4B8K9Wm/g/7vUGG3w5tKDuCXibklUora/eSGEgMZVVRr
         pHlm+dYJ9K9bWzGH19zcpmR/GICMzMUWk+4VLFq84CaY6Ygko6liG4X9JrM1hwdR4jf4
         Euk3agYW48OqjfC9zuW+3lxZu9EIhDRxESDOP1Fld1hdiQFa1K/EYM4fEIZCfK5SxnG2
         c3MZOLAd38/q114chtulgJ3Kf9Es8DIjHyd12AFzIGqrjugePp40mlNLDEeD/LQ58mA0
         1gXiZwM0rzICSfHD7FkaTvThskySJtlkufnuBK6N0O9qj7dP5CDhgcUhZ7FczKAZO1WL
         NdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737344549; x=1737949349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLtSa6qx1Q61Nceuhdk/ga17TrUc0F11jZYjzTTSq5c=;
        b=uL8y9vtBvITfDGCbxwRAxuZQOo0aMCNbxEBOkZ/1/GHdFIlOjEZAZwUDs49p6GqjUg
         fmt7AO7+eSFPbMQ+BfFyNz3CPc/xxAoABVNPVKHTCJ6qVqTBbRMCoxn4lPFwTQZ/Y6ih
         XlqLSXcB/ZBKOOiO0iU3LnvkzPWhOcdMtPSWFZ/yL48JwySFGXVNiSU+NsOlnU0Vng5I
         IXofUkwtETTjbuzLrbRVZoh/XbfshUr4y9ChKVuYDLOlJoo5yxeOxZcke3FjEv/9T3QN
         RbSud7KQW7YDPnB+Fj6wyReUJoqHyW8oDhH40SzQ3zxnujnlJK95S6jkI7EDqjjVV9q+
         izWg==
X-Gm-Message-State: AOJu0YxiIWK4wSwZ3YUuXM1/JaT6pbFpZxMmx//2t+QjpFq9Hx6u4Z7J
	2U4SXH/8LeM+vM22dHZgqLrOv9kLuumUwVKg0EelUPeX40cwNC9tELUzxpUfFXJGg9hifT7Njz4
	=
X-Gm-Gg: ASbGncsE0nYb91uK+2pmWn8b/rjM8+NOcg2/XNiAp1WgOlFaol5gNn6D4ByV2bcHIv+
	fxWfdxqcUK5i1AeU0cLkmHpXPWdrn6kFF4OpP8DfGCDAt5vRs+pNd4OGcklLSQ+kz/K2dDOC5Hh
	+HRW2m/VmcEmWJDqwz6dzRzZN0+dMPWRi9+Y0uwbGJIo+pzbwTvXJMgUGzQa76G15mz8JRi9BeC
	ItjIRcrbQunKAEkYt47//xOm6ycbFLJNzvhDM07sTE9Uk1s3n48+HPweH4erg==
X-Google-Smtp-Source: AGHT+IHHV/YGZeaavmACdmGj/ntZjqoXdxItEFvo3YrgCz3Xf/JTWd3G6EUVhb8mJ6LzNE4eHS1vXw==
X-Received: by 2002:a05:620a:430b:b0:7b6:d736:55c1 with SMTP id af79cd13be357-7be6325bba0mr1950118485a.48.1737344549387;
        Sun, 19 Jan 2025 19:42:29 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147ec9asm398533985a.36.2025.01.19.19.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 19:42:28 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [PATCH] trusted-firmware-a: fix mbedtls license checksum
Date: Sun, 19 Jan 2025 22:42:17 -0500
Message-Id: <173734453845.344589.17548707303913853624.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250117103647.490244-1-mikko.rapeli@linaro.org>
References: <20250117103647.490244-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Jan 2025 03:42:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6338


On Fri, 17 Jan 2025 12:36:47 +0200, Mikko Rapeli wrote:
> tf-a 2.10.9 uses mbedtls 3.6.1 from 3.6 branch which
> has the same checksum as in tf-a 2.11 recipe. Found when
> downgrading tf-a from 2.12 to 2.10 to debug hangs on zcu102
> board:
> 
> ERROR: trusted-firmware-a-2.10.9-r0 do_populate_lic: QA Issue: trusted-firmware-a: The LIC_FILES_CHKSUM does not match for file://mbedtls/LICENSE;
> md5=3b83ef96387f14655fc854ddc3c6bd57
> trusted-firmware-a: The new md5 checksum is 379d5819937a6c2f1ef1630d341e026d
> trusted-firmware-a: Here is the selected license text:
> vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
> Mbed TLS files are provided under a dual [Apache-2.0](https://spdx.org/licenses/Apache-2.0.html)
> OR [GPL-2.0-or-later](https://spdx.org/licenses/GPL-2.0-or-later.html) license.
> This means that users may choose which of these licenses they take the code
> under.
> 
> [...]

Applied, thanks!

[1/1] trusted-firmware-a: fix mbedtls license checksum
      commit: db933d55b46683f6349b027d6483a3b99e1fec3f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

