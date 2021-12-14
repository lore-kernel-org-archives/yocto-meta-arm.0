Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C600EC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 18:58:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.30402.1639508324937266663
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=z1l2EHg7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id z9so19346885qtj.9
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bOfOuzFK2Dez6Fs033GoVz/bmFrz2PBUop0M+HIhd0w=;
        b=z1l2EHg7PIFSu7aU/spTxarR88nJX1aOyZlhFveqqgV2lf+eKyRnTHpuCtwnmieCxg
         3kpl9pkKR0SPLmmGwa2Va9HBC2sk2i516UGt9aAvwIPxy0zR82pXxH7ipoemKm1UPmyD
         NVTnPRJqKyJGExEEKtk/gp/GvZ5Xt5C3ACjWTTNMPWFdKMv9RHDCCW7ON8Run3mumBNB
         nbyZfnnOpKf28uu1ZmMaAsGTquE2gXqBkJKB0KqHawizhXCqvI4p83uUchAeKt1j1Ji3
         VzW/kLLPfPOm4dU9dKQNKT7B0/d6FRg0TDWLD/3Q1xei/Htbq80S5kUXNF5tuAT8AIFb
         ZWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bOfOuzFK2Dez6Fs033GoVz/bmFrz2PBUop0M+HIhd0w=;
        b=mMnWwWjoF5RxSxlUO3wbooPGwf1Y8QIzpBBDrpBxrZ6AEXhiEo7NoNpmmcdm6+I6AY
         D/cmLU9juhGnWb8yxfhUavhfXAc9+DDg/p06O354+mT8NNFuOPOlGdvQ9oD2v32aDT77
         z0qqKbusVTwDreRjHWGd+FwKgKkmzx5/o9YyYVZ0Jz3vtC0GkkdVsQBprMYvxo2H+vPe
         XJrAh7+d0Dixb/CtNfvJ5GBD2a8LA7QnAu8MlPBAdZDmEcJ58NJ28kCDF8o5ULoWB69d
         beDb273ERxRkAy01eT6Kp/GLbGCdItCT1fqJAFAR8JGdraOpf+OAEmRMMBVXE2y8BK3g
         5qtg==
X-Gm-Message-State: AOAM530XzuzK8Fe2QiIPOj126hav5L6WDqWprsCx1Lbcjg0l5RVrUB8Z
	q+XhKoiqkorpwrqU0nOknvPOGYqyl3BpHzxE
X-Google-Smtp-Source: 
 ABdhPJwzMvK7Y10h+pZs2s7C4ys7JnVJdKoBQVbQsIQ6orujjJT/DRUSEdJHSPtz+DGawyrS9ou+fw==
X-Received: by 2002:ac8:4e96:: with SMTP id 22mr8164103qtp.76.1639508324037;
        Tue, 14 Dec 2021 10:58:44 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:61d7:b140:9e46:6475])
        by smtp.gmail.com with ESMTPSA id
 u21sm413077qke.95.2021.12.14.10.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 10:58:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/9] backport "corstone1000: out of tree patches
 for secure partitions and psa-arch-tests "
Date: Tue, 14 Dec 2021 13:58:29 -0500
Message-Id: <163950830961.29010.4574288410569342287.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211214110925.9936-1-abdellatif.elkhlifi@arm.com>
References: <20211214110925.9936-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 18:58:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2710

On Tue, 14 Dec 2021 11:09:16 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Backporting the patchset from master
> 
> Emekcan Aras (2):
>   arm-bsp/trusted-firmware-m: corstone1000: Aligning with TF-M master
>   arm-bsp/psa-arch-tests: corstone1000: configuring crypto and
>     attestation test
> 
> [...]

Applied, thanks!

[1/9] arm-bsp/secure-partitions: fixes required to run psa-arch-test
      commit: 12a5fd5cd5ce2ae6698f144fb62248708a35bbe0
[2/9] arm-bsp/secure-partitions: corstone1000: Use address instead of pointers
      commit: 50304a2be66adf3a8ffa6dbd423b1bbdfb2b0c18
[3/9] arm-bsp/secure-partitions: corstone1000: Add psa ipc attestation to se proxy
      commit: 9c83efa253012cbe0957db6dd0bca7802b4aa7c7
[4/9] arm-bsp/secure-partitions: corstone1000: Setup its backend
      commit: 6e075adc0b5defac7222a13accabda06ecd3ead4
[5/9] arm-bsp/secure-partitions: corstone1000: add psa ipc crypto backend
      commit: 751ae8fe38ffd78e35f3c412d950bf7982985e53
[6/9] arm-bsp/trusted-firmware-m: corstone1000: Aligning with TF-M master
      commit: c4ed1d1c21869e5a884b22f6574b2d7d02dc8a7f
[7/9] arm-bsp/psa-arch-tests: corstone1000: configuring crypto and attestation test
      commit: 075638cf00be053cc1433f27b4194c7102a92398
[8/9] arm-bsp/secure-partitions: corstone1000: Increase SMM Gateway variable handling capacity
      commit: fc6637b5e2565cf3a5311c79b9380526fd9c9b74
[9/9] arm-bsp/secure-partitions: add capsule update interface to SE proxy SP
      commit: bc8c92afab2f80133c15c3720878253d9545c4e5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

