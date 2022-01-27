Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1560C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 21:55:20 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web12.4762.1643320519717815123
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 13:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=IrFx13f2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f49.google.com with SMTP id n17so5437098iod.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 13:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zqTOFWs3BvM/C+o4NJ+3utNRXgE3QEfAycxSZdR2SSk=;
        b=IrFx13f29eiWT5mI9euZZrk9UO5wyzQ11ZPe4HB+uv4OXdqywWfa2rmLzkk18gXqW0
         TEXi/rojb9Us2mM2bzI8XxA6qoaVDJlrlj2kXdqt8ESJBYbW5CZm1g3dRkU6CdhCphrK
         +54vaoMX0DHKN1mmVX4n3Mrv+0bHzuDnsV474JP5KkN24lL0v1vnQqlLHuYzFKDLx9cK
         2sFsHfLS0dFi+pu6XWrB1SBdMY3/QnIRNAbMdJTaxEOtEDaxh87j6FVLSdeEvfsqFxtU
         19FDpkhZICkGq9TZeBcMg5htjm14lvY32LKMeA7QaIAd76cUapre1tqn3fYBemZLztWz
         md7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zqTOFWs3BvM/C+o4NJ+3utNRXgE3QEfAycxSZdR2SSk=;
        b=rk60hCxcVN0fU103xGeVzxBN1lGiNL9Dx2PY3Ax2BLbZQB4Q3NdzzVJcZY9wl6vAhD
         ihqLSuZjukqZjXRcdSaPUqGojj85cFlO8hjl78x7P/5fszqJ1DpgMOopGWHVBukcq78V
         jaGAOSdEUHcumMSMTcXzXxGSOTDWxw1L9BkiQIJpmFZkNiphULQvgd1onzIflGF+/KQC
         K4bF8CtGuXHFO8mdgrMaJtlMAaHopICcXyCE1i2csNA8uAx1rliTUNhtxhVf52k6cD7d
         tFgjbA3EjdzpCP6NqNpy1M3ZOo7bfmnsIhraHH9QT0M4cUT8ug3/GRPOon5KsxzuYouc
         C21A==
X-Gm-Message-State: AOAM531fjeA4cMFHlo8l2J1/tMMWxxYatYNG7C3VU0C9yz0lHVc7+PiJ
	OmP7qkAoYhws/g6GiJtEdtdUJcd4+PvVdQ==
X-Google-Smtp-Source: 
 ABdhPJxyQHey8PZkfTsROsbLRcIp1CkH1Z1oX2wd3tl9xQLI/914V2zDPuWC1q9FArMC6Rm9aCVrKw==
X-Received: by 2002:a05:6602:2c8d:: with SMTP id
 i13mr3476574iow.181.1643320518960;
        Thu, 27 Jan 2022 13:55:18 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:9284:4f59:da90:5ac8])
        by smtp.gmail.com with ESMTPSA id
 e8sm13055422iow.53.2022.01.27.13.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 13:55:18 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] arm/trusted-firmware-m: set OpenSSL provider path
Date: Thu, 27 Jan 2022 16:40:42 -0500
Message-Id: <164331964239.2816607.7625982803954404748.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127165419.952245-1-ross.burton@arm.com>
References: <20220127165419.952245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jan 2022 21:55:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2924

On Thu, 27 Jan 2022 16:54:17 +0000, Ross Burton wrote:
> imgtool from mcuboot uses python3-cryptography-native, and the latest
> python3-cryptography explicitly loads the legacy provider, which is a
> separate shared object in OpenSSL 3.  The search path for providers is
> hard-coded into the library so the wrong path is searched and the module
> is not found.
> 
> Set OPENSSL_MODULES so the right path, so that the legacy module is
> found.  In the future we may be able to be removed this if the explict
> use of legacy algorithms is removed
> (https://github.com/pyca/cryptography/issues/6809).
> 
> [...]

Applied, thanks!

[1/3] arm/trusted-firmware-m: set OpenSSL provider path
      commit: 1ee79374727224129f47c56115b18dea4edbd553
[2/3] Revert "meta-arm-bsp: use old python3-crytography on platforms using TF-M"
      commit: 778236335a983cd3e8e55857a19b83daf20ef8b7
[3/3] Revert "meta-arm: add old version of python3-cryptography"
      commit: 8a42328437db26071339162fd3c5b23d104eed60

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

