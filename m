Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6436C61D97
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 16:25:18 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.95002.1700756713037344302
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 08:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=aIeiwhiG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-77d6b28aa9aso55648885a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 08:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1700756711; x=1701361511; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aru69OR8zXDovb/1CYUrUzq4ijHVra5fR7uygdW3oC0=;
        b=aIeiwhiGUgOozLH+C7l3yMy9KhO8txg3vgqW9KyaHanml4XS+9qroe1sQUDApyO8u4
         igjBMvzvD23VDmVTD62b0OHyGm9t0Ce/1WTPsnVEIw8IfUD6UmSi4sCVs4wmaYld2MLo
         HzZUrlbljRd530kRisrToX9rjTogSB9vTBnd1NWN4/fvnnZo5PT5JTZD9iXFnmukOB0l
         5mF/7rILC81PY/d0Mky2RkXC1BBlnR27eA+gj4zlVUqp6jj1YtJU8rcvYk9RT1S1d0Ls
         7w5w8EpTfSfn6HTBddDmks91SzCzhPjIhxfwXsRep1U6sVU7rVjSi8K/vYhe+Z0AFmZa
         TApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700756711; x=1701361511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aru69OR8zXDovb/1CYUrUzq4ijHVra5fR7uygdW3oC0=;
        b=RjutTvsO66K0bSXY9INAIgoB+1Ht/CkwNb762gKeYdBTC0ZB+lc3+2l2tMlFGYPi2F
         7uo0CTFmbi0F4AZw4D/ZV/mcgOYS4gwdwwssu922LyKqGGkOqB5EQyyXVHVFjpeSRtj4
         IivSjK/OM7RmVEmQRV03B8jW8OJEBJOHLyP6Zb2B6b0HErTZxk2OWpsiF4TVBR+bP2GS
         VwTKcERmw9uPE3XYhbEfSNq2apND4i7LYIRMNzW+zaomkz2nfMqsAswWNOPz3uAEj6I9
         l7Eh4ZGw/FEn03znwBicIuHR4Ism+Bf3MkQSS5zm1a1I7U1G0NG48b5VjVxuZ9Ai2Zh3
         L3oQ==
X-Gm-Message-State: AOJu0YzljlZ4SnMlg7G9MBGKPj4YQZTMF383Ua5V6ndOLjpyEcvyZLae
	5l/51giuHC9KMePTppc+LY9yluDb5LbEtn5Ry48=
X-Google-Smtp-Source: AGHT+IE5wDXLQHmN0+/nhbS/h+h5gZBkL9jA7Ysq4q+7V2VhxVNTaSyF51056SgtTdGwf+zPejDm/w==
X-Received: by 2002:a05:620a:1b87:b0:77d:7670:648 with SMTP id dv7-20020a05620a1b8700b0077d76700648mr1556054qkb.65.1700756711128;
        Thu, 23 Nov 2023 08:25:11 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id o21-20020a05620a131500b0076cda7eab11sm547056qkj.133.2023.11.23.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:25:10 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	delane.brandy@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/documentation: corstone1000: Update the user guide
Date: Thu, 23 Nov 2023 11:24:33 -0500
Message-Id: <170075667407.1682259.12482802704292912806.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231121141742.272096-1-delane.brandy@arm.com>
References: <20231121141742.272096-1-delane.brandy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 16:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5261


On Tue, 21 Nov 2023 14:17:42 +0000, delane.brandy@arm.com wrote:
> Update the user guide to include Linux distro installation on fvp
> 
> 

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Update the user guide
      commit: da41dd43f427d591ab6b40bea7374f36ecb3fe19

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

