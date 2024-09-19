Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBA7CF3967
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:04:54 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.2772.1726776288705661335
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Sep 2024 13:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=yQr+J/xZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.43, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5e1b50feb9bso764265eaf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 13:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1726776287; x=1727381087; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5TbPHgRll/jzBiNZeYnFmDp0wkMzQTiab1RgCkKbjA=;
        b=yQr+J/xZEn0hnWuX5GfqzOHXH/ZsJHcLonOw6rGvRNaZ9P13F48Emtsgzm5Wq8htCr
         8ubR2BmMj6HZxWBOS4HLPF+pIyZ13oN6MPs31CWW2kppuj+5y4cnVfq5iQLDQnmLNWxh
         I9NpYvt6PCumv53BPG129pW5NZiSuyFfCmus/CPz5o1Jb1Lk00kJz6zFHrYsc3d5Q6jM
         vDaNzMoNYMvK4VrQXnecKHZZgsmQ6fpsxyPi3y9uCD7LcM/jp5kX42bYfvnc1ycjBkU/
         qvLw8Xb39rFgfvbnqpvo+g+7IAOsQU4CQjAsgl1WhFliRM/6MvAtOqp33LB6KihWODhh
         NNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726776287; x=1727381087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5TbPHgRll/jzBiNZeYnFmDp0wkMzQTiab1RgCkKbjA=;
        b=xU0F+NU7R1K1iwut7zqLu2cEfNd8M0/+JFTXhQjRV2Gv6tExrtn8rXp8zpoXaEB0Qh
         Xm4IB24qYQ0IklcIT0s3d0oAeg7OLN6Ix4sTJJFohDPBMYb62fj73+3cWS2DiCE0M45X
         Kntua9AvdhJWISsvPTio0h3YDQ8ewS8SBMOy4AQO/LOm5oCd4MIKL/9WGk/OPyGavPQk
         sMzizl7aNCrz4DbqKvnUEBVldDCYbXPCZk5CjQCZuTGSGKLf+2XPgk0d9EYmB5Mmn9c6
         7euCuiS1sZy3Ynkp+a0e4J9gdz0wt4jQHnNbSo/OCvmBarXqTr9LYjDpOyleFEnbtzEd
         gT2g==
X-Gm-Message-State: AOJu0YzTWH69E1i1RmUF0X1IOhADy3Wmu+8Nq9Ii6bCk8GBgF5THX8dl
	iqVsBeWyLFZrnWPYn84HiVuH8ruuljab11xWlkuC8LwgLWV97RuDc4K/VTwXi60bpenj41U8kOA
	=
X-Google-Smtp-Source: AGHT+IF398vjoiNqaKzGARZhgDKFXHbNTeGbTByYb1g1eo98yChwnnxpoBq6xXLzKHhPel5cZYPrHg==
X-Received: by 2002:a05:6358:618c:b0:1ad:471:9b7 with SMTP id e5c5f4694b2df-1bc99da3418mr3481955d.18.1726776287514;
        Thu, 19 Sep 2024 13:04:47 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb07e1a9bsm104178585a.23.2024.09.19.13.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:04:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/libts: Patch to fix 6.10 kernel builds breaks
Date: Thu, 19 Sep 2024 16:04:26 -0400
Message-Id: <172677626879.3549922.13366950685319596107.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240904145538.2538-1-jon.mason@arm.com>
References: <20240904145538.2538-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 20:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6090


On Wed, 04 Sep 2024 09:55:36 -0500, Jon Mason wrote:
> The ts-tee driver was upstreamed into the v6.10 kernel.  Remove
> arm-tstee driver package, since the upstream one should be used.
> 
> Parselogs is failing on the qemuarm64-secureboot tests because the
> arm ffs linux kernel driver requires gicv3 to be in the DT and logs an
> error if not (though still appears to work).
> 
> [...]

Applied, thanks!

[1/3] arm/libts: Patch to fix 6.10 kernel builds breaks
      commit: 5c12aab7973711154bf850d7252e7e7d35be4f31
[2/3] arm-bsp/linux-yocto: corstone1000: bump to v6.10
      commit: bd1e228d4a35fc2d2fd64e8cdd00cbff322a26cf
[3/3] arm-bsp/documentation: corstone1000: remove TEE driver load
      commit: 6ce3f43792bc669767315b5cd3a85545f832098e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

