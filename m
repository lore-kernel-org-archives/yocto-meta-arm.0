Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568CAC07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 01:33:24 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.34813.1698197603408666378
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 18:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=OVPiXTC2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-778927f2dd3so272597185a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Oct 2023 18:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698197602; x=1698802402; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKDWYUYm4x0V5NFLJPpHQzxH2V3Txy5whTTo33Y7hEc=;
        b=OVPiXTC2eKrxLeFA8CKP2ZsqPOb4OX7bO0yh9Ru6VuFgkkZjiQZsnA6Gqfa5xQ+AzO
         VQf9qRcuR6zcqslgilaa1rM1Gik4dBH13BI8sLLiBUYazVNrkUmYjdYm3iNXBtfz8X50
         Ot5UVW24qpZeIuW+HIT1dVVxHeG3GEmBj2yluEZLd5OUpSCFI7qfood5ugq3M3iOzN7Q
         mRVWf2vVAMLpQvlxJXBDZSplaUtDbnb/0/W9mqbiUxngmWGEX6eVbD+2mFAksjfriI+c
         bcfEEX2vNXN/FvYeHMDPNl7azdTTYwWqiUvM6NnYHgztlgIKtazs5uwGUNbTgTNy4j2Z
         2qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698197602; x=1698802402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKDWYUYm4x0V5NFLJPpHQzxH2V3Txy5whTTo33Y7hEc=;
        b=Pla7wo7YkgvyQZINE2FOUYsfKvOUPkTCkKjOeWTP2oOzatPI0v9K1pM1Yqa1bI5oVQ
         d7aA6e/fnOTho8LwUGlzQSaqXk3XvzcciADjmnZ1YdafkoJ0q73106edrSaz1RHo4neC
         0XxZDNbUPfkFlttJgyb2i6//RgQw4HDlALO48Bb/jZbkE72hU/Ho9noznMWh7yoP96Uw
         BEo4f1KOQdb4b15DlumH/41K+O/RleblOLb4Xrh+wiZP0uP33gnwOd91sdzq1WWrsSmk
         pdMLKqQgEZp+DtGAahA2g8K2v56lFxusfSQdi8/EAw8jdNUeDWMhPMo3vcsIFvRPz8Bn
         PvOg==
X-Gm-Message-State: AOJu0YzL3eQmvCOhbolqPkY0++NpcFhFCxuZRlnp7sC6PcSl4FotbwBf
	/M0OMUEo3Wbq4eEQ5HWS5/yKFJq1kmEEg+Nc3u0=
X-Google-Smtp-Source: AGHT+IG8VrGUQnDa5K0KmcnlzdDPVZmaeqndfJAUl+m+H9RoeQ9EgjOaqFb1yxyB8/TF6yNbkb4TEw==
X-Received: by 2002:a05:620a:d8d:b0:76f:93e:4b2f with SMTP id q13-20020a05620a0d8d00b0076f093e4b2fmr13657192qkl.38.1698197601795;
        Tue, 24 Oct 2023 18:33:21 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p8-20020a05621415c800b00656329bb3b1sm4036609qvz.10.2023.10.24.18.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 18:33:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	mariam.elshakfy@arm.com
Subject: Re: [PATCH mickledore 0/2] arm-bsp/n1sdp: Enable OP-TEE Cache in N1SDP
Date: Tue, 24 Oct 2023 21:29:17 -0400
Message-Id: <169819735774.1892682.8635654908063632904.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231023121701.22149-1-mariam.elshakfy@arm.com>
References: <20231023121701.22149-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 01:33:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5168


On Mon, 23 Oct 2023 13:16:59 +0100, mariam.elshakfy@arm.com wrote:
> From: Mariam Elshakfy <mariam.elshakfy@arm.com>
> 
> These patches enable N1SDP cache to improve performance,
> change location of OP-TEE from DDR3 to DDR4, and reserve
> the used region in UEFI (EDK2) to protect against
> allocations by UEFI applications.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/n1sdp: Move OP-TEE to DDR4
      commit: c3ee38fca534fd7b84503adc875086843403b96a
[2/2] arm-bsp/n1sdp: Enable OP-TEE cache in N1SDP
      commit: 60eab95971dcef139e76fd2ead3b663b5a87840e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

