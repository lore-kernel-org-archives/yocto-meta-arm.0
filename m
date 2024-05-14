Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A340C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:18:54 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.18540.1715699925980753310
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 May 2024 08:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=3Y9vcDCl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.53, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-23e78ef3de7so3031021fac.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 May 2024 08:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1715699925; x=1716304725; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTzriBsxcK5Gzz7QG+egGfn9w2/PwH6iu59uulvP2nc=;
        b=3Y9vcDCloUU/P08pvxkg71MxkO4zHuMRPAMcY/FpGgoLrj8nbK0dys1k5qs2epvq8x
         nokfhu1d3XsIRt77ZoviKIakYyDmRB1vAJYol/MNCEbbp0Sff6x9cy20+o4yjfBIP8zD
         cZRjOi5FDHx46czIV7nr0x0sUBDpFY8HYpNyAcU4yByEcbPRoG8tTaeWaVLRrIcNppuY
         W8BixZmCr4QQ17nsNxzq9GIBKaZ0+zPz9tHyL9LXokq/uMXU5cVHMX/3IOkE7KLMu7Dg
         QIKwh/SYBrzDyNuBwpn+MdB4PNjkX+Bgt5yLKBm2kH9M7zxwNHOLApXBGkfch/j4dMhD
         ZWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715699925; x=1716304725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTzriBsxcK5Gzz7QG+egGfn9w2/PwH6iu59uulvP2nc=;
        b=cxEcytsfoqcW9OZznt0ICEbHAg8e6Y52yxliDwqyUSgfk9/uLG74rO4lMny0Q4QNIk
         h3Uo8TvVAoUmgX+1jgF70NWMM8NOb0tZi+EBJeUohT0WgHwamFKlHBv31lrQCvCdtVtS
         7UzAKF+CVxQg/6Q4A+8BUspvXXSLq81C2ezN1UHswCfsKSuZ9QN+CjFsqzOC76CPzDcY
         jRHkFEu0xr2kQ/OV/COUKbYtX8DSfdhqmGnM/2nXtktthZDdMPPs0L0nORpKFDy2G6Y8
         qgDNDfrNAa7TAEi6+gsO3CuM+CvliL+QAHUYlnIlErCwrNsw7iIxVxeoDarqOMN4OwvS
         hWag==
X-Gm-Message-State: AOJu0YysZf8rd0cwOZ6MjiIm1DrS7FS1sCOXsoHbWEHzY2wbo2y+t2c7
	RmiSCw9+/twIZSTF89qkvHMofcvLB+c3jY9gCHeTZoJqbMt+Dm+BcvcZW4BQfQbFbNLQbPCIitk
	=
X-Google-Smtp-Source: AGHT+IEElJIPccuNC1x8Ypxb8nmYmYcjzV9hKy6rqXb9aPVmTXDEbZxY6CbpcfVk5qcbpcBdbPdTiQ==
X-Received: by 2002:a05:6870:b52a:b0:22a:9ea4:c18 with SMTP id 586e51a60fabf-24172a922aamr18051307fac.15.1715699925093;
        Tue, 14 May 2024 08:18:45 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e1fdefc89sm19539541cf.61.2024.05.14.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 08:18:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/trusted-firmware-a: use correct git URL
Date: Tue, 14 May 2024 11:18:41 -0400
Message-Id: <171569992096.1325141.18209168217334085487.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240513155622.373417-1-ross.burton@arm.com>
References: <20240513155622.373417-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 May 2024 15:18:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5714


On Mon, 13 May 2024 15:56:22 +0000, Ross Burton wrote:
> As per the documentation[1] the correct git server to use is
> review.trustedfirmware.org. We occasionally see failures connecting to
> git.trustedfirmware.org so hopefully the documented URLs are more stable.
> 
> [1] https://trustedfirmware-a.readthedocs.io/en/latest/getting_started/prerequisites.html
> 
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-firmware-a: use correct git URL
      commit: a6a4952e8c911d5ead23fda11d4c167d85c29a54

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

