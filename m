Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87023CD484C
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 18:26:04 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.5015.1695407163536704569
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 11:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=eMOV5lPV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7740c8509c8so132502185a.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1695407162; x=1696011962; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0tVjkrCPeESIsYE3B21abCZOUMqqiEg6GRiVHTZgr0=;
        b=eMOV5lPVlctGYonkWqKuk3gXARmhiiu3NKseIVjMDfqtPv9HCVd0K5ks8JXc8ZQtH6
         VGbn+hXPw7+bd0NnKlAGmq6btDF7siNwjQwHzgJrvifBInqsIAymbO6M6sDjDlTCSeTi
         hASaEwvmpCqHN7+NNb2OCrikbMVKW7FlhY8WnQe3h54SBjii7CCvG3u4sETagg+mzOD7
         r/fnNK/frVGu5U1xNVM5kf/PlPA6/f34Nh+Mc6HcubUvZ4BTu1dOWDzZkNKHHxAa5xLQ
         8agof9q0HPrFitcp7gTsP1Hs1/axSjvq/J0qHgPETxqc9DStt22Zncs0/t9jZEPhHcks
         9S9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407162; x=1696011962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0tVjkrCPeESIsYE3B21abCZOUMqqiEg6GRiVHTZgr0=;
        b=O5zQnFlJlhkfGsRTicAsFBx/eGDR0Pus9K7MTGwpRw3CL9ErrqkXntCsw7LHJTlynn
         pu/QA2qv8Gsn+oOnpwWUSptT8VZHvwGkKQ57rPsnks+uvVM4e1/ti7MKpa1s+INoU5au
         Ofcy4tO3zioKFRbo0s4XdTMAw8Dt5wLRERhmQFZ1P4GxnpyZ6YPCd1f+FEYWWVgg4EjS
         PHI0iL3cdRNTqW6LnyrD3Gst/mmqJmhnYmRvEdcYC97fBc96aHvgh5eRc4NbIna26y6B
         AHuZDNRKQf6LqrlnkEwJliksWewBRAfyKu36EVcXvFTlU1DO3MhweiHTXBaqrlXQlQAS
         iF5g==
X-Gm-Message-State: AOJu0Yx0gPak5CJAkFnyfnAuyauGAwQewhQGrLrwUnQc8O/lCaDrvqXI
	SMb9TZiNL3JY/NPkuFauzElXCYqDTuOCCWnzZXM=
X-Google-Smtp-Source: AGHT+IFWk9k7lH6c6b/BfqdbZPAo0tPKaOokC1/D2x9TMk4cYpkFu6k5sv62xPTNOsfXpAMZeSd/MA==
X-Received: by 2002:a0c:dd91:0:b0:64f:40a2:59fd with SMTP id v17-20020a0cdd91000000b0064f40a259fdmr79930qvk.60.1695407162064;
        Fri, 22 Sep 2023 11:26:02 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id e4-20020a0ce3c4000000b0064c1b27bf2dsm1619674qvl.140.2023.09.22.11.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 11:26:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/optee-os: corstone1000: Handling logging syscall correctly
Date: Fri, 22 Sep 2023 14:20:00 -0400
Message-Id: <169540680443.309200.9312043605027410869.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918180424.26148-1-emekcan.aras@arm.com>
References: <20230918180424.26148-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 18:26:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5067


On Mon, 18 Sep 2023 19:04:23 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> Enables handling logging messages correctly.
> 
> Emekcan Aras (1):
>   arm-bsp/optee-os: corstone1000: Handling logging syscall correctly
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/optee-os: corstone1000: Handling logging syscall correctly
      commit: 4fb79a2f7c10b397cd4ecb8b378bc5bbece935ea

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

