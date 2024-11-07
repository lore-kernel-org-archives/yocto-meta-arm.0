Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F79D4336E
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 15:02:15 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.73876.1730991732483807448
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Nov 2024 07:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=R0rMb6pg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b154f71885so67863885a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 Nov 2024 07:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1730991731; x=1731596531; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCy1RXEYrbI1dHg9vgLxKoXhKfrhbRZAxjtwP/rMS7Q=;
        b=R0rMb6pgdsQKbM2q7hNp3VNzwn/XhuIG6Al6IL7+ykCpXuMcPi23zpesj1S+f/vanq
         aowtyrMqZ7cS99ZflFISwxVEiguQEi7CJFT+B2bSCPINkNV7umu6lSYHG5frxVuGtbs0
         BWixsrl/gr+aLKLBddm2NxRmCHdbDQC9xMM7F5Ug+pnte7klsykJ5Wqt2H7nVi1yQMdV
         F8zHyglvjglaThkBm0Y/3t/KuuDxsmrpvtoa5wHvwnbZJ2crIHublb/ZZreXOLnvlKOU
         aTsJg6EneJbgKvGyM6CaapbvVb4SJRNGMbGZw6CffDJxvEmkA2/au3Xh7D1xRLlF8yM3
         B8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730991731; x=1731596531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCy1RXEYrbI1dHg9vgLxKoXhKfrhbRZAxjtwP/rMS7Q=;
        b=odJdLfV1idWrIXZBtvP5wo3rqk23D5MHQ6LEIWNytnN5LdxE5DUBt2cyk5N/1VS4VL
         ZrPL2g3/Zx9Df3MZHR0xQ+cPs3OFTOGRfG9RlkgfPc01iS8Al5mEEjUNvYwDm4Sh+IXQ
         pyriAmkUTmEqatDaGchfugC83tFj5Rt6C2P30aF4ZznpPw4NZwObX046UnVMzBbpKFuu
         kw9jXb4PowyjkU89VfLcm8V4tigFjp4fwH0ThHW+v7INpFDLnRzk/891cY4nzr1S78Ta
         in9v4BO51q0d8pPbO5Dbvk/4y4mWl1ey/3CP/kvY6yisIfDUzXA1pZNbBh0SUY7Ledq6
         tlOQ==
X-Gm-Message-State: AOJu0Yyv/CkswaZFh2cPxBC0CcUCNJCtGBbSzxM5GxioYXrR4pN0bw3f
	t/QbiSK9IKFF7MezXCARk4/iQa4kRu+MkzyY2qDo5F8zYLUA4DayCpKAPZEZ15U3cVbiP6JB8T0
	=
X-Google-Smtp-Source: AGHT+IHXHh6vrIVVASaDQ71BWgwlu+QPeR1+4Rvv70MaPjE54b3VUxcMo88PoJ+OwOPHffOCwVAryw==
X-Received: by 2002:a05:620a:4629:b0:7b1:4330:634f with SMTP id af79cd13be357-7b2fb9d886cmr3258165085a.61.1730991731258;
        Thu, 07 Nov 2024 07:02:11 -0800 (PST)
Received: from localhost ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac869f5sm70434485a.64.2024.11.07.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 07:02:10 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH scarthgap] arm-bsp/documentation: corstone1000: Add SystemReady IR v2.0 certification
Date: Thu,  7 Nov 2024 10:02:04 -0500
Message-Id: <173099172517.1350689.409874414167333607.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106114905.1916463-1-hugues.kambampiana@arm.com>
References: <20241106114905.1916463-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Nov 2024 15:02:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6245


On Wed, 06 Nov 2024 11:49:05 +0000, Hugues KAMBA MPIANA wrote:
> - Add details on SystemReady IR v2.0 certification achievement
> - Document additional patch added
> - Update release notes with new milestone tag `CORSTONE1000-2024.06-systemready-ir-v2.0`
> 
> 

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Add SystemReady IR v2.0 certification
      commit: 7088279c0ab00c7dabefdd4544951b4746b48476

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

