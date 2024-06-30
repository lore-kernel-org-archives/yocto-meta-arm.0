Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269BFC27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 22:23:20 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.6862.1719786196961347890
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 30 Jun 2024 15:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=zt/E/CJI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.175, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b3655297aso19316527b3.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 30 Jun 2024 15:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719786196; x=1720390996; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWM1KhlJMZ2gdN4Svl1oSyiJqFODr/L+fieXHhIJ3SA=;
        b=zt/E/CJIc4DCGVEas7vga2gji7w/n1lLZdjUNMaD3BzWaHGKtxyDjXIYPcSk0it6aU
         TvJ2JISOD2d6TlYcz2t/NcIJMJsm7q8vcySVTVuLQhVYqY6QmyY2c+ESdAAB9RqJGsA5
         22qgOoSfG9WA/0VGYpopPwxVu0cZq674M1/CRq7m1bX1dP5f4IIEQW4fycSTsii17ZmC
         J+XFrLPmkbzQxgfxli5jNYPnRd1+sLTgWVfL4nLkeCxifOiJO9Hz3c/ggnphDFUp3Gz2
         hNVuIvbYshnRTSSnHc6si2ctDjjZ+PdZckYWxcT/utymxeyAbw8xwVE9VIN+TRmNniAb
         /F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719786196; x=1720390996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWM1KhlJMZ2gdN4Svl1oSyiJqFODr/L+fieXHhIJ3SA=;
        b=O5NY4GirNmD8fwL7fjpegUcGZl24rSpWkkHfQijVfME3BDlJVSW/L0T6wsY8gFzK+b
         VjUYRnlkLJaDHv6QQp7WoK7HIps5s5bciAeF+Cj5Gdnl/phz2X0ppF3PCwNsDoGLQyVr
         hbWM99AbG1ts8COfg38iZIlJA0iI0CwxL3b5N3bP+o960P17IPZVhW7DKJ4K7yOfTXLS
         vroEXiT7dE9BNNzDRwmn7SGhKVwrvWGLw2/N8ufND13fQeuPvBiHM219ycRRYJLCiES4
         b8PAPNMwmLgCw+KTIYeG2cHCxb2t1C0qIOjhXr/5R5gooAJRWqtOlNUFjpbkpxtXiNXf
         UJYQ==
X-Gm-Message-State: AOJu0Yz9e5NZdY1V2ysAFbzwtqz/nvofXC8hHk2Qibjc7iLNLk0t9Zut
	b+MDvyjQ6alTI6+z1M/QpI90uozlvQekEsGMA8XdF1sRwe0mf/pFw/cSwLBCpeunXsA2jwBtCrY
	=
X-Google-Smtp-Source: AGHT+IEaEhSxvtis7eQ7glHEqSuX+VcicvmF3pnBCc2lI6HC28ntvhu74wn2ZFuIP9LD05Zk6MhqUw==
X-Received: by 2002:a0d:ea8c:0:b0:63b:d711:f06d with SMTP id 00721157ae682-64c74594eefmr43655277b3.33.1719786195499;
        Sun, 30 Jun 2024 15:23:15 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9ba5a8b3sm11246617b3.100.2024.06.30.15.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 15:23:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH 0/3] arm-bsp/u-boot: corstone1000: fix U-Boot, Trusted-Services, and ts-newlib compilation issue
Date: Sun, 30 Jun 2024 18:23:00 -0400
Message-Id: <171978618238.360838.10095840357434751846.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240628133145.1444437-1-harsimransingh.tungal@arm.com>
References: <20240628133145.1444437-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 30 Jun 2024 22:23:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5852


On Fri, 28 Jun 2024 14:31:42 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> Fix compilation issues with newer GCC version 14.1 for
> 
> 1. U-Boot patch
> 2. Trusted-Services patches
> 3. ts-newlib package
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/u-boot: corstone1000: fix U-Boot patch
      commit: 6db296637b0fcade01a6b1f5c6e64ff97317573a
[2/3] arm-bsp/trusted-services: corstone1000: fix compilation issues
      commit: 0e5be701763dde66629fc0ac996ce931e5f3d5c6
[3/3] arm-bsp/trusted-services: fix compilation issues for ts-newlib
      commit: b13a35906a403012fce72262cc15ba07464cf9a0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

