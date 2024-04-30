Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C973C04FFE
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 03:21:51 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.6686.1714447308855089671
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 20:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=yxJAvcHj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-790eedf44faso166225385a.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 20:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714447308; x=1715052108; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dalxrFUHyLRvc0t49zCFHRNmdUdbMH07+3+jewfA4vw=;
        b=yxJAvcHjcOpydy1KCl9Dpr+TamyEe3FN0lMsM53inhCYRchkE+Es208gvNLlcbb+d3
         Ce56S6YOPG2ReUjt7wnoO8w98uQ1KmVxU1ed12Hw6XR6NkE7sucQkqAIA+xjGIhShObw
         ZKjbVF6AAizBYdGaf0zYa+WB7gt3ke1rIa+Lt+4Xe3KaVlvtJt1NgR7eyMNsJdlwcji4
         SdhNYSHJN7b8tWSoNu8F8ueO9+FpNhGNzXo8SASRLzTCeKahFUSe/H9J8A7GcIodLIqa
         vC1ZS91W78bTPxL+i88t/zk7Iuz9iWamblXyAImeTWAU/TsRIUOCHon9JIODNJJMfnIH
         SKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714447308; x=1715052108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dalxrFUHyLRvc0t49zCFHRNmdUdbMH07+3+jewfA4vw=;
        b=pTKtYjfrjEnjIomQyVl3+G9RF5a5jdPClSfftXAk9ARST2h27hH2AnLPZvhDICxTba
         X7qSFb/i+nULNvRJ38J2zhNWM+0jIIv1TcPQd5Bk09hJDqFj8kSfb51VzlxFIg5ZgliJ
         k9mVYkCOPm/tpo5DcT57CFXucJ2DfPeodPeDkMW5+eOGAKd+2gORAcJzKhxUlwouKxQx
         efJDVUDw7kJQDeGG5DcLppoiytlSLfLoRTteFEkL6fTXype4SEdpcQlD1JkZsbQPDwKj
         rMUYa1niSt6CWTyKqWWgcR3Rlkb/vnlXA/fDRsXDod3WC9oYHqmgZU8m238QCOoP3d6u
         gHwA==
X-Gm-Message-State: AOJu0Yw1pX1q+KP4sQYLSnik/MEYHZA8o2EQSjbpLweV+m97f9stm7km
	vtPA7P8YOpgav/W5x0AwRi/R8EbXdjzzburHxvRTurtFdJismLYcnE73elBCq6U3ri4gNKtN1q0
	=
X-Google-Smtp-Source: AGHT+IHSuDH7ks1RDx2M9jshqRoSGSfyVc8d4Ohtnuc6oLyQR11e3aK1X6Tdz/YxVLprnPYyRCINCw==
X-Received: by 2002:a05:620a:12cd:b0:78a:34a0:6354 with SMTP id e13-20020a05620a12cd00b0078a34a06354mr13562526qkl.42.1714447307643;
        Mon, 29 Apr 2024 20:21:47 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id u10-20020ae9c00a000000b007909ec6a8cbsm4433632qkk.74.2024.04.29.20.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 20:21:47 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Gyorgy Szing <gyorgy.szing@arm.com>
Subject: Re: [PATCH 1/5] Add support for the TS Firmware Update service
Date: Mon, 29 Apr 2024 23:21:03 -0400
Message-Id: <171444726776.3765152.15678822097178782909.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429152654.94534-1-gyorgy.szing@arm.com>
References: <20240429152654.94534-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 03:21:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5633


On Mon, 29 Apr 2024 17:26:50 +0200, Gyorgy Szing wrote:
> Add a recipe to enable building and deploying the FWU service
> implemented in the Trusted Services Project. The FWU service can
> help vendors to meet PSA certification requirements.
> 
> 

Applied, thanks!

[1/5] Add support for the TS Firmware Update service
      commit: fa05df1611e8038e2529c8d41bdfd308e670488c
[2/5] arm/trusted-services: update to 2024 April 19
      commit: 2d46f217315de4f0e08d3ad92474e5ec1d8c7d7c
[3/5] arm/trusted-services: fix oeqa script
      commit: 798c0a8257052a1c5478948047ddfa727c310112
[4/5] arm-bsp/trusted-services: rebase corstone1000 patches
      commit: db2284fc01f9d097ffa6a6bc5ad70a1d76a422c9
[5/5] arm-bsp/trusted-firmware-m: replace OpenAMP with RSE Comms
      commit: f63c043ba7e765140646ce4e50252375a8f8e831

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

