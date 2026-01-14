Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA14BD39019
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 20:33:57 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20324.1768422827643075647
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 12:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ugI7Hz3p;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-890228ed342so1272476d6.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768422826; x=1769027626; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/qYgtiYdph5HHoMrLSqFfOKDY1QGQZV7qK56tnp56I=;
        b=ugI7Hz3pn9GrO9BgHAwUaqlvLTFiDuk0HuX+fxJQfD8IXrfqJhA3bfltIcWd4VU/bj
         DZxeCmqxnHV3Rywx1oo6ucunmwciFmDp2SShN6F+rEXJ8wUFTXDB+cVgOHRrCBxdDX+c
         jUI9EAVhihDpk5mpPeDPV1RxJlALYD+t/o/Hb8R8HL5pCDrVx887kOeUdy+y5Ta8zgFp
         IDFoh1m+Gzfmci+oKvE9fCeeyqZt+YJ+KKjrUtc2wOoZjZcaDD/fzrWhL32Jk0P09JuM
         xdZYrcuGsscwefM70kPjoNhiw8uCe+guvSE8OpDl8XeGHMRC8MPyx6L4HOBVIZ0ILZSr
         hfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422826; x=1769027626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/qYgtiYdph5HHoMrLSqFfOKDY1QGQZV7qK56tnp56I=;
        b=aDB8hFFIQfEsBivWnBJ4KSahZQS2pJ+WsrEUlEykegwkCaz3i9vbLY3K7FFZ/UHpPO
         A5aE1/HbVlVgKSFBkprqQswPVV91DMRhd60uU5NwRtmf1WhLyt+oqNN3vKcb1Nmchmc7
         3kz39WddMYeJ62WC1n5g0manTlHy0lEZNk2C5C64qh/as1bXmz7P1JIp1ZJd00JECPzj
         6Nqaw5/n9y9xtoGucmtN31GqULerJN1Fy5T+ugo6bTDGB/pwY7jwQRkjGha8zQJlLmVg
         PSTh0tLpSzkVdADg0Bt3GYe0LEURYVTVQ4EWVhxBNg28SbNVVJVsKHn9XchJq4sI+5w0
         k/Yg==
X-Gm-Message-State: AOJu0YyMrI9f6q8ofT/y3aZaQS2IOzSQUt+1UvcqNtL1gFOZ2+omahDs
	5cWWHzZAOKmG72qZVIv/WkAblbSUMLZ25ddvKnK61C9r4Dd4TNDTIUCqueT0MjufEey4m3J4LJ+
	akDM=
X-Gm-Gg: AY/fxX62wXxX8JMuR+d4XADLWA311G7onUmEqLZZTvhedptWdCCwYsUdhaNHHXX1Ri/
	qAddebZ1M/w/MLc9mt9TkIXXahnTxrC5EMzhsjtgTDrCEpwo/2dwNdJ5bsTuC3B2tLzc6EQRjkG
	A2RCdzEhg++d6Xu8QNsAZMy9z5CRYphbGkYHmfoSwZ8hk+bK6ftJKvgOLiRJw+TOx7CTWYAf83n
	9MLkO2NQhO9Qj9phxgcOWCBl0cX938us2jjMnEfkbK9tAYlJjt0Bo4pNM97IPiesnxvu/2KpDvz
	qonwdFC1SN4dpo9cvH58TsgEkt2aVFfyX6GURB6/Wz3tb1GAHJJ+6ZLOkPOgvGcpHOsp+gNbNtd
	30FEaPRYEb5yqPpkwSK1KwcBZxY8lCd51C/a2dEYUf2fZKCflua73GI+/cIAX4/Qh8woo7R8NIb
	O+8RKsBg2dYOM=
X-Received: by 2002:a05:6214:1c46:b0:87c:f64:7571 with SMTP id 6a1803df08f44-8927431db7cmr63337936d6.23.1768422826345;
        Wed, 14 Jan 2026 12:33:46 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077280fd3sm183530096d6.55.2026.01.14.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:33:46 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH whinlatter 0/2] corstone1000: Whinlatter release
Date: Wed, 14 Jan 2026 15:28:00 -0500
Message-Id: <176842248234.3731607.11936661782699938111.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260108201812.37201-1-hugues.kambampiana@arm.com>
References: <20260108201812.37201-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 20:33:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6846


On Thu, 08 Jan 2026 20:18:10 +0000, Hugues KAMBA MPIANA wrote:
> Contains:
> 
> Documentation updates
> Pinning of SHAs
> 
> Hugues KAMBA MPIANA (2):
>   corstone1000: Pin layers SHA for whinlatter release
>   docs:corstone1000: Update user guide
> 
> [...]

Applied, thanks!

[1/2] corstone1000: Pin layers SHA for whinlatter release
      (no commit info)
[2/2] docs:corstone1000: Update user guide
      commit: 9d3e85c7d8d9c56f3898ca56321aec0955daf84d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

