Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA511C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:16:40 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.13552.1646327799921170607
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=J1sIpQDn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id e2so5141806qte.12
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+d52IhaDnEA5X/sPDkkE9Ux/NAy2GFtGq6unsfDGLKc=;
        b=J1sIpQDnP1YFHn8nEdCBFh4K/BWCeC7nrFsiu0fxep02RohVzkB0FEtDdAGCvyca8S
         3HPMvUM/+EEPyQyXGkgfq6y8wiGSuYJ8HF1ychhyzoUEIQKkJ+ExX+COUgSgOwY20+a+
         eNQY4uJOd4UluulCUncgb6VNb80zZq3MW3oO1ZoW0bBrjyoq1nHu0GP90/Ke+/YtczFb
         +znkCy6p/vkoB6lBzhHya/Dqcfd5K01r3PCW5gxUQkBeho1OI+mXkgyt1GocnT1KwIWZ
         9E0ZF+caJ69cFRrLiQR0Kmsnz3D1o6e/G/YWXeYQzzIJSrgOjvxoi0JSmybzQuJ938tH
         sXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+d52IhaDnEA5X/sPDkkE9Ux/NAy2GFtGq6unsfDGLKc=;
        b=Jjc4Izd2phUy+CSHIR5CzSuMs+AK8veDOMxWAib5KQwzZtujhw2O2M5OAYNTxZlCCt
         PksRN0hnMwoMLDXiTxhJpXVvVriqsmMErZxLABOjBnXCu8Ce37uFB/iIsHbC9iZ1NU5R
         GmrGekgNY1K6QLeWwh2yYX5RgmCLxIz5pjIvc8X29CkaHIOX6Qob2fZ889OO7RNPqkoR
         AHTpxUeAHTu79BcT20emaOm7L68akcxONpJ9Pg9j+b/E3Xiba02hg8j8hoiMnUaICvYe
         x/48pVQcOkkYmM8AFlebrGWoo43wmeIaSQVdJDwKF1wIlYVfviYGGcYM7XUKsBf26bBv
         L3Hw==
X-Gm-Message-State: AOAM530erXA5TjYi2kHQfvZ8F639Fcs3LsWNTwiszT/SE66Ddz9EA27J
	JtTVtIGMLD3fkgS7LYAWWNO2URobhOcX3A==
X-Google-Smtp-Source: 
 ABdhPJxDppu70JR+0RYsyjf9kKflKSCB7UQPQtc6xGgArpX0pmk8j53+vGfNeFdNVwcq38rbt4Jx1g==
X-Received: by 2002:a05:622a:1ba6:b0:2d0:6f2:d309 with SMTP id
 bp38-20020a05622a1ba600b002d006f2d309mr28383874qtb.389.1646327798905;
        Thu, 03 Mar 2022 09:16:38 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:cf54:5e99:f9d3:d9ad])
        by smtp.gmail.com with ESMTPSA id
 w20-20020a05622a135400b002dd9806d532sm1714566qtk.54.2022.03.03.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 09:16:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/generic-arm64: use latest linux-yocto
Date: Thu,  3 Mar 2022 12:16:23 -0500
Message-Id: <164632778401.2165565.8362678776952285907.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301161616.1959578-1-ross.burton@arm.com>
References: <20220301161616.1959578-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 17:16:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3103

On Tue, 1 Mar 2022 16:16:16 +0000, Ross Burton wrote:
> We were pinning generic-arm64 to 5.10 because 5.14 was hanging during
> boot in qemu, but this appears to have been fixed in 5.15.
> 
> Unpin the kernel to use 5.15, and drop the defconfig patch which has
> been upstreamed.

Applied, thanks!

[1/1] arm/generic-arm64: use latest linux-yocto
      commit: ce5e683f01971da4c9958a138f1e956e001104e0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

