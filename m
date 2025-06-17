Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD43EC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:00:41 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.19622.1750168836598300968
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 07:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=NRDLc2XC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.180, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-40a4de175a3so3856332b6e.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 07:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750168836; x=1750773636; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sm6AM0Vn6JrCK434UNw62j+7FqIo9+3WuYBTGp4XdN4=;
        b=NRDLc2XC8yxERYxmSFJWY5Z2H5lOkzzu7RQe+mmv1V+B5KdKSpWRapdsVOhFmwDjNM
         AQ1kBa2eVJKqUkZPwtJRtJzIZnfT7J8jWtYFy/CxbmOrKZ4Wg8qvmh+/hsA8qgRUm6RV
         sPoec0M+T9cnjpANTATL3gzgnb0tswb5QYNxPqDLVh66mhv8kBjJyY4w+JC9REewFJcC
         5r7s1cThgaL+28IOnv4ljLK+YFr2s5Aacp9JSGKAczFvUxhCXB/bG+CpeND52PabubXq
         7F69ffyMw53GMLTVVlA2UfMlniQbaqjJeSM4dac0MX+dp2Rn+Sg3eZkYcLq7wXRG0ykn
         K/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168836; x=1750773636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sm6AM0Vn6JrCK434UNw62j+7FqIo9+3WuYBTGp4XdN4=;
        b=se61CJIRYgGAhkSsCIFJqiaEn73lVSgFz84h4cUGKASB+mbT0jODvZvW8A8XrDixf8
         K297843dZ5tft9bnp9DHjd8B2sE2AlUQvdBrGkJUZmjxELg2PaVB5yEbiiBcevDRzqd6
         /e3Q7MWo6fshlIxlbuKc/EtdBDGiTtk8/oYdMumnNC+Ef+lDog2ugjb1tJZUDbyJzbNi
         BEJk+IKTz4d7yVxOId8HSacQ/u7gqt+3oVvCN/imwZeC2nU0mhCBiqEbkB1+GxHxCthX
         1KCrAj320CvG/4cLA6mGPzRi69i8t/3jCQPMuA+Xho8qHHgjqe+Q6OKCl0dj3sJ506o4
         1hfA==
X-Gm-Message-State: AOJu0YyRMlrXl5vndKBOAqUHMNHSW4Uyd5KTBBCZrxoz5Yphudy7kDKY
	CqTHwSHW0YOe56lUG8jTDwW5U/v0Dlgbt5AnfmkrErSQ1wnxMHSVmUkFHf1IWWLqQ1uW61fnf10
	1tYY=
X-Gm-Gg: ASbGncvKiZBHcGyEb7kCErfrXnLrpuNf7z1qSHJYIlgSNs3F4qiNA3/zCj0oZHES19+
	/2Ncp1/RMKKUw4Ok9HFavxxSeRLZLLhe9PWbsqWRqSRCk3K3xf0UKiNruTAY6NlZBcRbbmWoShZ
	82SBZG/Uot2SuBA2IoS87+fX0sD4H4tt2D6dtHG8VPj2vx6r+v+MATl1pYVkMCjcZ3rUXK8zyXJ
	NVv1VjZC5lmHnGcaFTlOazSvlxHwP2ZDJCJy9On482h/7vWlrdKLffGtmPUTnkiX/mBBXXMTCqC
	XYWilySIyD/0anHG9i8qaXwI0gfae/SjHi1JKeLaRL3JthlP5VxkQQ==
X-Google-Smtp-Source: AGHT+IFrL4d3t0FohDpeicuCYIGNrzYTA+72xm2GyWzCPG/GlF4KOkk7zDOrE1sEYOz/glkgGxrz4A==
X-Received: by 2002:a05:620a:24cd:b0:7d3:90f2:c19f with SMTP id af79cd13be357-7d3c6cdf674mr2146281285a.31.1750168821580;
        Tue, 17 Jun 2025 07:00:21 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dfe457sm652551485a.37.2025.06.17.07.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:00:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/edk2-firmware: localize BUILD_CC assignments
Date: Tue, 17 Jun 2025 10:00:13 -0400
Message-Id: <175016881295.1961984.12664990599092088838.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613124542.4099863-1-ross.burton@arm.com>
References: <20250613124542.4099863-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 14:00:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6557


On Fri, 13 Jun 2025 13:45:42 +0100, Ross Burton wrote:
> BUILD_CC and friends are only needed for the build of BaseTools, so move
> the assignments to that specific make call.
> 
> 

Applied, thanks!

[1/1] arm/edk2-firmware: localize BUILD_CC assignments
      commit: 043d8c94f5c62802a8fcbcb5f551984f2ef00a89

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

