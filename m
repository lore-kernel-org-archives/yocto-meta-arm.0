Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38094C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 00:01:10 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web09.56.1643414467898146613
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 16:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=cznxaS68;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f174.google.com with SMTP id w5so6826780ilo.2
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EzNYei5ZQz1Rpdx+S3fouLL6wk9cR+kZfrggVL1pKYM=;
        b=cznxaS689+ATAkVk+oWL37aBDKTZ2EJRwHZrybklcetFH5zcSyW/SfT1Tju+3r5ImK
         RoHbhtmnO2ey2EQX4yTrI4OsC5F8xWwhbmUoVysihDqnMnvo4ja2/6x6ck9uH9uiR5gy
         dHJdrX8mRDf6duV8CzUNEGIXzwn21XimNJRDXXUiRiudMGOTBTQrRfQsGas16aXmJ9lv
         5BqR9BvHlBNEFaRZKGBCtTMCJMJpaUDUqYDAc0wlICxAe/kkZZozRMtqeRbXNdvH+ONp
         hiRNV9nyn9sAyFeUkzqjqi3JQrxrlWvW9qzfrKW/CPKjuHvN0qsNoQ6aBBtuVflL1vOL
         at1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EzNYei5ZQz1Rpdx+S3fouLL6wk9cR+kZfrggVL1pKYM=;
        b=rFNmFS9daI9tDH2wyVdt1J4sfRKIKDzDDpXuUXkrmFeln39vJ9w+mOdttxqaNLFZYH
         cB93aNDLE9PRqBse5bN7o4gB8Zk5qgygv7Bcxf5Z6tbCKtFiONMPl6oxWHuzo68a6+P7
         kXVYRnGeLSzBZ/3ZT/I/6dO8c3WEvHkyeoLxno7lOX1FY8tZiNmkcWf/iLWaKll7M/zb
         m8PhfKPELe4nVJhK2rhwfmKbTecDddLFialAqX2Z23CIQg4zf+t75Bvr5mU57Anfmpi7
         wVBweKR1SeD084c81h6guGOlXQr2hd6xAgeGgPjrUfesQc3YVj3E++eWjIqR7YaZx2CR
         REeg==
X-Gm-Message-State: AOAM530M2/1Wd6LdM/UQqj6TForqg7+ANO5Vcvs1ficFroOrVCfsrEoQ
	Oijf7s3DOYh6VPWQcuDzlotWg9O5R5F/7A==
X-Google-Smtp-Source: 
 ABdhPJzgUZKx4hwmW9lkUVD50MX1J7CnmlJAEqSjJLtxh8yX+nY3WFpDxUBM8uFchky4FQ7a+cr4Mg==
X-Received: by 2002:a05:6e02:1a4c:: with SMTP id
 u12mr7406126ilv.203.1643414466979;
        Fri, 28 Jan 2022 16:01:06 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:b8ee:1cef:2d10:1f90])
        by smtp.gmail.com with ESMTPSA id
 c24sm6508889ioh.40.2022.01.28.16.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 16:01:06 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH][dunfell] CI: use the latest release of the Kas container
Date: Fri, 28 Jan 2022 19:01:02 -0500
Message-Id: <164341446234.1076823.17311266218336629367.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220128191907.2767570-1-ross.burton@arm.com>
References: <20220128191907.2767570-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 29 Jan 2022 00:01:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2930

On Fri, 28 Jan 2022 19:19:07 +0000, Ross Burton wrote:
> If we don't specify a tag name GitLab uses the 'latest' tag, which for
> Kas is moved whenever an image build is made.
> 
> Instead explicitly use the latest-release tag, which is only updated
> when a release is made.

Applied, thanks!

[1/1] CI: use the latest release of the Kas container
      commit: 3a2b7d55c7fdfd80e2f8c23d07b4217293c6b050

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

