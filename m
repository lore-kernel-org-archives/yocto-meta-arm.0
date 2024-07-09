Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4165C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:45:49 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.12004.1720529140574021415
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 05:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=rhjuWBCz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.175, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-643efaf0786so40704877b3.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720529139; x=1721133939; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6TvVyPhr6s4OfFsYqFM7mPMKPW9RSk7iP7UPfW+pEY=;
        b=rhjuWBCz/T55HgXFXmTe1UZNAz3QqN2YNEe9sm4WRIp8qEwgFEn2ciLBTNtWPoDh+r
         6wGDFzsr5nXWdmWtDbQp686xdAeebgoyHS4OrDZvoIghPI7xMWrx1ICDvuyxqn7FlFHl
         B6d+nMyfsuDPwzUKm8I1l1tv72VYJ01gRiRXi1RgRBi5cQJhbMFRkU84SLZr7jQQCLZ0
         NYKrCZt9w2+vz9a9Yoebv0k3HwDUoKvOOBEaYsDhAOQk14m2pW7zaPiPtEA7QdrLJx8e
         QMl+AK2aJssZIIEblR5ktnnDVxN5+HS6J04FOHBd39Jh0odbzakQw3OJTfkB+V0cFbmE
         Z4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529139; x=1721133939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6TvVyPhr6s4OfFsYqFM7mPMKPW9RSk7iP7UPfW+pEY=;
        b=gt4k7+i6LgFdCPP6TbEvHU0CHYTeJRWXN23Wj5vXX9d9lkD/YSwKzjKoD1GYu8m/b8
         DZecmVQIQC9kfkDHzFMlup1LRCW/GFztnIkl1m1PramBwz7jBcy6HJZQvcL1hVogSg2G
         wN0P9c85zeMbs5UPv0gBWUukicdwfOjkduJ25gD68B44ni6OwKCZfOOn6k+zmx55FVr+
         VVRAd8wykZ1xwH8w6PnABbK8F1cFfDKQX/Enw4vOtGVlmhFk2Djb72P6BtARnwWfvZxT
         wZzaVMoCKXbOSq8RDs67MP1ZpPWXrfEbWZIJcyOfl+TVCGbrVFbNg5+lfRI5mSefe32X
         flqg==
X-Gm-Message-State: AOJu0Yw/pGrWeUxP/mPmd4U4ZGViVhhD2garvTIL6LWYnSXL/fLex+XV
	n4IdmpgNalYM+dA/ZRbpns0NPiBtpF2CNqc1bu9upRY9WqMpcG6/am7lXazHzBkIbzBsREEBBJg
	=
X-Google-Smtp-Source: AGHT+IHv0eV0bav/J3FBIkev0GYGB8Juhh0leTOLx2lCmRMcr+wpa+AiG/bBMMFcaRj77VDgYaHNnA==
X-Received: by 2002:a25:d38e:0:b0:e02:c6fe:aea2 with SMTP id 3f1490d57ef6-e041b03fe9fmr2840215276.7.1720529139177;
        Tue, 09 Jul 2024 05:45:39 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a99aea0sm288334276.54.2024.07.09.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:45:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	delane.brandy@arm.com
Subject: Re: [PATCH] arm-bsp/corstone1000: Update Corstone-1000 user guide
Date: Tue,  9 Jul 2024 08:45:20 -0400
Message-Id: <172052912046.1983569.12270913394693302187.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240704094952.982354-1-delane.brandy@arm.com>
References: <20240704094952.982354-1-delane.brandy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 12:45:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5873


On Thu, 04 Jul 2024 10:49:52 +0100, delane.brandy@arm.com wrote:
> Update the Corstone-1000 user guide with the new instructions on how to
> rebuild the platform to enable multicore support and run a test to
> verify this.
> 
> 

Applied, thanks!

[1/1] arm-bsp/corstone1000: Update Corstone-1000 user guide
      commit: 61f5a0b1b6ec6024c1e43d2811c234dc5dbf9200

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

