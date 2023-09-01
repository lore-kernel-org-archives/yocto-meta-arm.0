Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC54FCA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 13:42:58 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.6597.1693575777414674410
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Sep 2023 06:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=XOnDHOyX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4121130e7afso11293041cf.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 01 Sep 2023 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1693575776; x=1694180576; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KC18NqN0HV0WZrBwFcHgOQsKPWsnPApo3UGnyrDVLCQ=;
        b=XOnDHOyXhVdoi8HOAOjHQWcMAU+CZDa6cR3Re+FzkJ5cgYcgTbKqw3mibHB8VjAvIG
         pukETc5mv/tbZKMs1aDZ+1KWK76gZV7SccqO3+0Sgtt4JPy1awXEVQGvdrX2h1WOmR5s
         QP+YPtaIO068bkwHI57JWN5/EbnH5qr8rRtpIq8osPrA+yq3jxB9mVezYXvDSieCBiYG
         W1B2QSZnxU+zaK3PgQVPVYHGpxI/r8vMtUmwMCdFA48H0tCQ7/eAgpvifxhSfpnvolRg
         ivgg+uvO5ltmhQC0fA1ghYArUur6wtOdch5XP3CzOjJf99Stu8RF7ys+zwtx3wcNW7oZ
         pdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693575776; x=1694180576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC18NqN0HV0WZrBwFcHgOQsKPWsnPApo3UGnyrDVLCQ=;
        b=bL/8nxjs3KY/JveIVAJolu9ynUeG+jw/T7VCdldlygMTzRHFn4GcpXXLBAwtBRnHLy
         67S1k/Juh0oKuSzH7qkaLYlRy1SGYlW2en9F6J6jJ4NhSJ4Swh4NJId9GO2fYo7273vF
         NiSlxUBbcT8lmOTV2REPPD3zFAks0FQyiyg84LWOHbi15Yo05vuihz7+Ku4ZizwTxHRC
         C/0fGjReFyZffTDSzuxIkc7bOoUGFsLhnx0l298GOHMEIMjUz4b+QzGAOOtw6HpNLNFy
         FXv3ehnvGi4pP/iAvg5sR4+nW/37qeEbBiqcY2WnpzdhQIhErCFUUg23GimT2xut9ImR
         b85A==
X-Gm-Message-State: AOJu0Yx4XtN7S18S72AFMg+AcEOc/ivJ5vcFGwqMCrJY0Mm9reBXzUyO
	37Kjr1E5+DyCEDvUszaysz0KHXVtskUVHY9uI+c=
X-Google-Smtp-Source: AGHT+IHReEOJdFsPc5NbpPkuh8sVqSIsqLHmxJ6jv9eIZ7ymDnElP+rSalnOOImelistmQzGMrfJmw==
X-Received: by 2002:a05:622a:11d0:b0:403:ae1b:c0e8 with SMTP id n16-20020a05622a11d000b00403ae1bc0e8mr2495153qtk.41.1693575775903;
        Fri, 01 Sep 2023 06:42:55 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id jc8-20020a05622a714800b00403cc36f318sm1468368qtb.6.2023.09.01.06.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 06:42:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/corstone500: removal of support
Date: Fri,  1 Sep 2023 09:41:48 -0400
Message-Id: <169357571143.149680.7230897683318068923.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230830183739.3694370-1-jon.mason@arm.com>
References: <20230830183739.3694370-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Sep 2023 13:42:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5012


On Wed, 30 Aug 2023 13:37:39 -0500, Jon Mason wrote:
> corstone500 is End-of-life'd (EOL'ed).  Remove support for it from the
> tree.
> 
> 

Applied, thanks!

[1/1] arm-bsp/corstone500: removal of support
      commit: b8367b72bf625fd2bc4a1e414356fa4d92761913

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

