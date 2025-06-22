Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E72C7115D
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:04:12 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.27847.1750604643023222437
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 08:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0ZIMb2k0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fad4e6d949so17777966d6.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 22 Jun 2025 08:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750604642; x=1751209442; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+Mxm3PhuZKhtwKYx+LI8HrGymBUzVI002T8zoAG5rg=;
        b=0ZIMb2k0GE++Hznwwsh4cx1ZFnQLjueVJbDnd3OU1gd/v3938ey2j3cOH46s87ZE2c
         SkImYA53LnnjNDMmfzIBtY6UCQt9u08ucG2i0ZgBGIQHC2zEnzZO2RXIkULhqp5KaLgJ
         mnR5xbVPamy+oKTfLvQ7D3BweZvI1BoSg8NcLFdcfx+m3yyDcvzeS15uSL7WWI1uQpWE
         8Je05qr2714+NQoTLvJ65kLUB/j8/1cBO7sGu9+VX2ItCRLipy9bixfWwFkj8wKzV7b4
         BP2r/MpXOAb5Q+VRyBqDK3o9tDR2uL+Mp6dnZcDvy/dE8Z+7vnto+QUHV2lV8w1T7xZp
         Brwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604642; x=1751209442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+Mxm3PhuZKhtwKYx+LI8HrGymBUzVI002T8zoAG5rg=;
        b=Shh+2sZ59sWwL0sWEW2/WZNckROPNiB8FfBPQha2dBYjbMF/QjtmAhZcltCXyfBhG6
         iGjoEbN4UNtfPmzs9uqW/nms64dE4YSTTpj4nMWMRSTCa2dE29idBHoFPH6M4r5DlKm/
         t4HO7NfGUJQnkQAKadxLDt7rMSxP5rYLcmUppQcH1KMWa8xR2h8N1XPxp1l4zRwZlTmf
         5cj43KMKzJe6rX0Bta0KVqcs60DvDn2/jCZ5tVbqbSaRA49KVM6BecrWtOtkEwKWcg4f
         NFpDulaPupV9dXNv+QLKAcRDOypcsrnj1rlTi7g7SNwhBMLTJ8a0UHLZP2Ey01Oum6Vf
         eQ+g==
X-Gm-Message-State: AOJu0YywDdAuoGWzKJBkt5Ipr4YZBqQr/J1THNkFxHHQle1IrDrUnb2W
	VGntVm0IrXsGIcxpqwkXE2wwqzsPu1L3OpVfT6zcuDXPohIK9spHne6QfpCKQBrEeLrYO6FwoKm
	uQnY=
X-Gm-Gg: ASbGncso7r36gLr2eM2PTBtG626MC5+K/zzIHXa8Mp0F8CX3HKYoiiH8Y9FVB+bqlnT
	2PvvYnAjll4/qlA+4I35k9nOPPvIBaCqDLWBGktjSNubYhOaB4z0fUD0FdnsE5xhpaoZ9Rc+5ch
	USgwhaBMz5eXM0fD14VL1KO0ywZ5vnx1n4vE+AowHgSAQ/BGESV/uZSrI2o/6xxR+0dFxYUYIzX
	/SAdog6HlN7EyIKaGXlT0ofBAZFhERFaVN7pgyUwPT3YxWY8Q9YqiTA+x3YE+fGBGPy94zuXYWl
	e9YenCMVTLLv3TFqEGCEY8cEHgPz/LSn7CYIhQ7WY0Ar7sO1gLkAtg==
X-Google-Smtp-Source: AGHT+IH7EkEWcH2Z3OChW3ckjgV811OYN8xR6TSVTAC/wmOeR6XNDlWbjcPEdNgUWRuRmYG8no42LA==
X-Received: by 2002:ac8:5a8e:0:b0:4a5:a91a:f439 with SMTP id d75a77b69052e-4a77a276af7mr163803801cf.38.1750604641513;
        Sun, 22 Jun 2025 08:04:01 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e7a56csm29230571cf.59.2025.06.22.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:04:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH] arm-bsp/trusted-services: corstone1000: Re-list patch fixing PSA Crypto Suite test
Date: Sun, 22 Jun 2025 11:03:50 -0400
Message-Id: <175060463220.3865854.15877713947684825349.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619080906.4131942-1-hugues.kambampiana@arm.com>
References: <20250619080906.4131942-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 22 Jun 2025 15:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6577


On Thu, 19 Jun 2025 09:09:06 +0100, Hugues KAMBA MPIANA wrote:
> The original patch was inadvertently removed by a subsequent commit.
> This change restores the patch to fix failures in the PSA Crypto
> Suite test on Corstone-1000.
> 
> 

Applied, thanks!

[1/1] arm-bsp/trusted-services: corstone1000: Re-list patch fixing PSA Crypto Suite test
      commit: bf3cdf7d5225fbe0aab7bcfb5ba43fd78cc47b1c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

