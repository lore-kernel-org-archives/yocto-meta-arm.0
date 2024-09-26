Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2CFCDE003
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 13:02:56 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.42153.1727355767283675273
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 06:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=g/9P6Q2M;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-45830ff5b70so6520881cf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 06:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727355766; x=1727960566; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ii21MprpGtNC/ajQehRaiJ3rCSNF8xyomz+LyD3glQc=;
        b=g/9P6Q2Mn9ahyuRrH1dm6zrY4Np9jiTj+yX8duIdYu7S22lt3yDvXEyq01XFkcvDL4
         sWkm4vt6ilKuOiN2Uxk+X304pnAF50agMwUm3WT0ojqIp/c4o6ck8BsN/VMoDbSLhG7z
         rcUJ16M+NHYgNYbmFitsOlbTm2x4bMCzZ3JbmKcfiJJ16lTGpeGpnR1zgCL3RKGSjjFW
         KbX+W5ew7c2t4xyczcjOQRDGJgpYzrlHoECkn6OaL/JvT50bVf/xRc556cplCC29EAs5
         T4WMSgQe+PrTuRnxcVKq/JN/ISn86ula1h0Ve3PFTms1Sih1NZqgX3am7r5RuVGEJEi8
         K8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727355766; x=1727960566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ii21MprpGtNC/ajQehRaiJ3rCSNF8xyomz+LyD3glQc=;
        b=Mf/i0usVyL+VG8MjCHrhzP8SkxpCB3pXZ+VrITGHQEyOGXp8+VDFbxFZCLmeAPMVjD
         mXSmquQCKHi7H8sViqUBc8UboB9aYBJ3NeSIgrHQOQgoJ8bfZpB/FohDGWMq1AW4LzA5
         QRhPq+RFg1mswIB5NY++p0rBQ7LmIF9zUI+GWS5ZKZ0OgpGy+tV5N2pExYVD6bGeCp29
         Y5MveJoAFue4L7t59TYsNO6/Y42TWI8tEQxQLEpaOSdeVNk3uFp11hpFm8EvhHgV0dT5
         LrFUOiLJEq5LmPcQVYY3oeh5uvGpsI5qhXn7cVFTp8J6nM2LvrHCOS9s6kEzYwTIgsEA
         p9ZQ==
X-Gm-Message-State: AOJu0Yyy9X3yekxB9iOfucHY05G2HwpaIeSj6UiYufe8T09w93U/ioHS
	p55yOjiuJOBnyDh4KBuzrT0eZstNRGxrF5vzpTF2qLBXhTGtbl6ajHN0zDnEe+So6Ol4ZP2hRWs
	=
X-Google-Smtp-Source: AGHT+IHIepMtr3+xaxTafIRddCY0a/148CefdOfzJ8GSuiZ25/F53DfWzW0VA02X0KGoxuZUOKhimw==
X-Received: by 2002:a05:6214:5706:b0:6bf:7bcd:78e3 with SMTP id 6a1803df08f44-6cb1dd81c86mr100521286d6.29.1727355765680;
        Thu, 26 Sep 2024 06:02:45 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb38766843sm2953086d6.4.2024.09.26.06.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 06:02:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: Re: [PATCH scarthgap] arm/lib: Handle timeout for spawn object on stop()
Date: Thu, 26 Sep 2024 09:01:56 -0400
Message-Id: <172735571614.3501347.973372052934938078.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240923160419.3160040-1-luca.fancellu@arm.com>
References: <20240923160419.3160040-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 13:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6115


On Mon, 23 Sep 2024 17:04:19 +0100, Luca Fancellu wrote:
> The current code is waiting 5 seconds to get an EOF on the
> console pexpect spawn object, on a particularly slow machine
> this timeout was not enough ending up into a TIMEOUT exception.
> 
> To solve this, increase the timeout and handle the TIMEOUT exception
> by printing an error on the debug console instead of letting the
> exception raise up to the stack, force the spawn object close() call
> as well, since at this stage we would like the process to terminate
> anyway.
> 
> [...]

Applied, thanks!

[1/1] arm/lib: Handle timeout for spawn object on stop()
      commit: 139e87e119489ad2d10d6389ca2ff913589df4c1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

