Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEECC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:01:01 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.19741.1750168860123295299
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 07:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0Um1/yMD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a440a72584so56121241cf.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 07:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750168859; x=1750773659; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzxoUwktRuzugPxDYez0YPO40ZVDJXrJGeVDYv7XMps=;
        b=0Um1/yMD+1HYwKAM0MeWTndtG3Wp4udXLHE1jDzYi62B73r90hLTaQ1ARCPGB1v2hR
         yTr6iCMwqis29BzE6VwZzQgFjL26VM7RQtVV0q2wXH1O581DAcq0oX/mYM0K0bO2hs7G
         psJ3kARVXqfofWRd/teQRpuPQ7TpabLrgQyhQCYcKOLRvMWobq1yExVN1eJ/oDO21cUY
         yuhM/W8OnDlutEujJjaMObkjlZfw8w1S+xpwMDkPNhWwwlmfXg/+SaEW68d8wY9RKsnj
         4anna3EEse/5ga4GXta9fAoetBserZcSWZhjf9huAQM8iyazbAKOjftfQhSZ9M92Kgwm
         ikZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168859; x=1750773659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzxoUwktRuzugPxDYez0YPO40ZVDJXrJGeVDYv7XMps=;
        b=OG/TpQcV5iGunvtt7xd5iqJ6wB8+MNuPrdwyFWa1BO/ksqB2y+44NjZdeUVBJYWiro
         8eNOapfj/bpO9tBf36enGUxLYMuaEBpk+uFknSpO84jv1G/7rldH6mt/CJ288ytJTmp4
         9BTOHUfm0eXqzEbW499wHWjSq5cJo3USShrMP9kCM3pFwJL+FjJw5+hBWlV2hEmWFXAb
         pGv3NioH6k/PUMscmZUahWqgYdDpX8q+PyqH1VENktLvvZqBWee4d2yWOiqQ+1JtWEQV
         VW/VR8XDVR2apNz91RP9fiBmP1ATKgoeOy7VIXIIcdKTnksZWNlh7Z7j8QIAOiT0ynz9
         f9Aw==
X-Gm-Message-State: AOJu0YzFQgO1ySj5SO6swoi5JgABykZY4UPVo8z4tvZOSh3UR3cGedQ1
	Vf0EbCWnjLLPIeiYuOiJG1BfPiKbg8HVb9DJOVuG2iGSrbr3LkAceudDUBF6FR3J/E1H84wl53u
	Kf/0=
X-Gm-Gg: ASbGncswblZQheSI6/BCkO1UbXU7CK58kHNVXxhuUzPcSHyCQMTRC4hMZEr91iKDNrA
	lTlhbOOUFVkBAURwdEmiDH+R3rkUa3k3SDHvxfdhzvPWOHrfu0zB+pmMRA6p/7RBFZBXGbuzj3X
	aBKk5uEz0lSa2JZ+IcDgdUBF228j/yQSd0jVIysXwbwObFwYsEUqSfMhWoQxp9TK5cbQVKOXa1U
	35gzKnJrfhQ9H0YlyLiy8g4SsFUZqO6RmVCJa2TcSJ2TFM6ozHWMru+ETsDUaWBe3ai2b6t1twV
	mjp4/mckCgsnQQSD/sqkB1+djsEhVTX055Rp9xmu3UHc2qw6U3jiQA==
X-Google-Smtp-Source: AGHT+IHUjLVAcKhSqauOhsHfq+KfzPR3ZsLa5YPuQ3YTSbMsqlq0/5aveyVTaVPrqPTsotshyuwutg==
X-Received: by 2002:a05:622a:1788:b0:4a6:f0da:82ab with SMTP id d75a77b69052e-4a73c6319cfmr227713281cf.52.1750168858724;
        Tue, 17 Jun 2025 07:00:58 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a30ceecsm61676531cf.29.2025.06.17.07.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:00:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: Re: [PATCH] arm-bsp/documentation: corstone1000: Amend for CORSTONE1000-2025.05
Date: Tue, 17 Jun 2025 10:00:45 -0400
Message-Id: <175016884823.1970111.17863510454865125090.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616055239.167354-1-hugues.kambampiana@arm.com>
References: <20250616055239.167354-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 14:01:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6558


On Mon, 16 Jun 2025 06:52:39 +0100, Hugues KAMBA MPIANA wrote:
> * Update software component recipe references
> * Update Yocto Project release name
> * Update Corstone-1000 release name
> * Update release note
> * Various other improvements
> 
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Amend for CORSTONE1000-2025.05
      commit: b52b4b7c4b3148bcc274cad306b9ec3ba657f021

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

