Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3ECCC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 18:58:34 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.30058.1639508314025419729
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=k5Csn9Ui;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id p4so17711147qkm.7
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mhd+saUG4Au+UPZqoVp8TvVQ6xwmlTIaiVyVyGQXC8o=;
        b=k5Csn9UiwrnJizjGe3K5M67ckHzDlnhMgP8fDXgQI5vs0mjF8QLO5P3gSabHHhhsdP
         q3gso95JT3TMx6fY/bMfeA+OE1GYpp1XUVeQyrUuKimIn6Qez6WDaRFx7SElKzu4xnfW
         ovO3YIeIbODUz1qRRNDoUKqnqWD6+vdyOzThUZaMvvswKixW2Lw/x760dFuJla9XbGe7
         iOAfZkjDCr9Wg3V/NHsOe4E5Gegr0OgDWsCxyBzJPnB3hsL5ngaa1TgAAkZ/aM0CRz7E
         3Uzk+pvqLOw6x+BF1VAxDBjHyjuiWB3s0QRCFtFZ7vM/Bwe9Bb3p1GflznZQb0Xx4DNP
         Ctvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mhd+saUG4Au+UPZqoVp8TvVQ6xwmlTIaiVyVyGQXC8o=;
        b=sSkH7Lr+PRa5lVxLvyNvW+i711cigzFfRHIg+kenuwBhh81JMF4VV+Nf43alxBSlvw
         XK5wd674OslnIhuWoGmSkKo52142UZ1nQSRzBlzQ/Lpyw8grt8tWMT6CtfvXpUMAsayY
         j4yyJkYpIlgxMuNegM3H4fPXl/7twIDDhBM1eyjr0TJh/0KNyLnmvE45s/8YdRV/ZoFx
         YhR9edWaPqAALYv3wwz3hwsFn4/QzkrzB5nH3V082QDWuytBLLglzeZXuqqGK5f5TTlG
         SOZOJe3lSALiC9Wg0cPAQMGi+f9aPCLzmnLI1YXcf6EJmvjpWTgBpXBCHxirp9beRl1D
         UnnA==
X-Gm-Message-State: AOAM530PtI+3lMh1W91K8+MRdVgGKoHtNIZi38Bw6DWFM08bKc67hWc3
	euRGnSeoc+szGQ4AEKLDUajVC8hObl2iZcIA
X-Google-Smtp-Source: 
 ABdhPJwTJYHkV4hwknBBFWa9ZXWOiToDBIfsq+qYhHijcQtvyotbuK8HgxBInYAHxVEEtaH6l6acyQ==
X-Received: by 2002:a37:9c57:: with SMTP id f84mr5623715qke.443.1639508313064;
        Tue, 14 Dec 2021 10:58:33 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:61d7:b140:9e46:6475])
        by smtp.gmail.com with ESMTPSA id
 v12sm591757qtx.80.2021.12.14.10.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 10:58:32 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/9] corstone1000: out of tree patches for secure
 partitions and psa-arch-tests
Date: Tue, 14 Dec 2021 13:58:27 -0500
Message-Id: <163950830962.29010.9001508820264796628.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
References: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 18:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2708

On Tue, 14 Dec 2021 11:07:22 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> New features for the following components:
> 
> trusted-firmware-m
> psa-arch-tests
> secure-partitions
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

