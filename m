Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972C0C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 03:42:29 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.29935.1737344547837524717
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 19 Jan 2025 19:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=15L2P++D;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b8618be68bso324475885a.3
        for <meta-arm@lists.yoctoproject.org>; Sun, 19 Jan 2025 19:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1737344546; x=1737949346; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nmc5C9FXKG+FVWheQ4NtcOpUMBWANNXVq8FbJzf5ds=;
        b=15L2P++DKWYO2m3L5919XQhtEwZl7TNV2kvrB/yfX6VaXV8XltWLR8dPD0+Qdfx4Xl
         KMMUM3+mBDAUlCXTPv2KJZ+AURSXFO1M123PZdbY+FShDzC8yG2vOnF+u2qAVzFx4HGg
         AwKXwAu8sjhb/g/PTlTlEMXSvo8rYXcX593gilIXFU215/THTkK1WP0zR/Ugx283UszR
         6TobzTys87xCGDlq02ydnTdp22sk2WjxuSXh7WHtLgSTD9MuqNuGXhPEkYQ6kGHO0Z2u
         jv+XLW83ShBXMRk+9Zju7Bnn9y2i1nA6DYzx0wE9BTJwVfRNgKDhzaXcF3b1tgOJWacI
         8wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737344546; x=1737949346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nmc5C9FXKG+FVWheQ4NtcOpUMBWANNXVq8FbJzf5ds=;
        b=BPHjQmhESLjZqyJOw8M6LApBn4Xm4EaxcfX5BLOempeXGMFEhgbJ16tzoYD+uN28+A
         0ZdX1MbhQUEQYQFHA1adSjaEISezv/0qR7hPMG54QkjPZdzkSCmUx+5TQVfe6h4sbwYm
         H7cTskcaeRUSf6D/czWjs4VhhzVg7rY60YO/n65B59Qo4hjBq5Ez69iX7zhCzBU4ZkdY
         LMmyY/1dSR1FTqdwu2bp0i/vst0DBRwm8Fl8uXeQn+XOr24Nc+riUvp8Pxjptid6GF3R
         5mEIKOZlNNAHqnqCYCVrRmNe7L2LTPd/HGV8i+y51lAoTlKcV7PP9+o4Bot4Vizp06Zh
         7g2g==
X-Gm-Message-State: AOJu0YyO8FyjZnHnR1S+G+E+jUKJ5HVPpgN//qZs7LRSeKJ0cZmwQ+eH
	ml2/LX4KgFfvxDiYxry7TJ+fKR/Uv0xYeQes6Ahh471Hf3fO05bq1mxNuixBtgR86TaE7K5aMGE
	=
X-Gm-Gg: ASbGncspjEYwpEGPHtTIVvF7FTQ3rtJ1PXYb5KiyZWQQuGsybqDbiSyzanwOzrZnVxa
	uVV3ee2d8GzsReXheEYEV7Pchdt0Hs9T8SB0QDnBJatjMU1VFMJz0aXBl5iKl6PqU3hqABfq4/q
	brgywIj+GtkHj2KY8COSfGreQ9mzIXYssj74Z7/JXHXX237pgid8nIuzv8js4jtYpUtQqv4Vit+
	ciDux52g28uxktztDE15GPZvmws/eORKEh13TTvP5Qw/mrzaYkUpos3Y27Gzw==
X-Google-Smtp-Source: AGHT+IHOFp6Zy0wpaZwJQ2ykK4pdTaPjaDzNs3bUTBYushlPvINJTpBJykFOxv9OrH+EhACTggQuAQ==
X-Received: by 2002:a05:6214:570b:b0:6d4:25c4:e772 with SMTP id 6a1803df08f44-6e1b2251083mr234817066d6.36.1737344546534;
        Sun, 19 Jan 2025 19:42:26 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1bd25003csm25409306d6.84.2025.01.19.19.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 19:42:26 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [PATCH] edk2-firmware: fix PlatformStandaloneMmRpmb.dsc build
Date: Sun, 19 Jan 2025 22:42:16 -0500
Message-Id: <173734453845.344589.11743679047914975009.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114094154.304900-1-mikko.rapeli@linaro.org>
References: <20250114094154.304900-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Jan 2025 03:42:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6337


On Tue, 14 Jan 2025 11:41:54 +0200, Mikko Rapeli wrote:
> With backported patch from upstream. Error was:
> 
> | build.py...
> | /home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/edk2-platforms/Platform/StandaloneMm/PlatformS
> tandaloneMmPkg/PlatformStandaloneMmRpmb.dsc(...): error 4000: Instance of library class [HobPrintLib] is not found
> |       in [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core/StandaloneMmCor
> e.inf] [AARCH64]
> |       consumed by module [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core
> /StandaloneMmCore.inf]
> 
> [...]

Applied, thanks!

[1/1] edk2-firmware: fix PlatformStandaloneMmRpmb.dsc build
      commit: eb9a1ec43baaa076f7e02b0bd8879b683dffc75b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

