Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BA2C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:05:02 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.1997.1667847889319246281
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 11:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=RIORZhRx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id z1so7760431qkl.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 11:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYBrMQ7Gl6iAZmQyL0aMtgo5R0RGR4cD3yhQZiOuYj8=;
        b=RIORZhRxGm5SE0Zd3DjQmRaAZXA9NQC5nn/CHAk3vkoCOnEmnfLOlJTgcBKoFACmwd
         MsoEgOIFiA3M0NSmPDIJlzJm7zKsC6WPEY+xlr3t6B7aoYp8Y98xvCNRqhM40QSFYvOC
         cAAIbJiIS0ZPQ0M6maAyomwIcGQT2rNp0FogoTFfp8WQSjFDEvMEsN8g+WrWqAGFcW47
         II9RUtCBR0bYYL2Ka401giB9xBPaSGANG9LEpQLWAT8kfwZlrbbHEaVSwdAX4mZORGnA
         JpEeS7IPaXrPoi7dsXXCvKPLrbAJwUKwuB60iGc8PkyZYwdL0+ShCXoepg7hkxIs9mLn
         1Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYBrMQ7Gl6iAZmQyL0aMtgo5R0RGR4cD3yhQZiOuYj8=;
        b=WQKzzWpj3DgIUyQh35tqDjiKNdDSY7XSoEo9uymc3GrFdMn++/G4G3XoLj1vsf7mwv
         qyFeKWuRgPlfE4zK2+E4OwtMHblks05BVAZD0EB2lbgMWEj5l6UcgxRPPoNFF+DFwUH/
         imygouxW1kOACnqcglrirVndxzqcmHnfLoE0WfP+cHIHq85C8vxi1gV3/TJkeaVcEFNe
         kaUMUg4QGtO4JYcwGqohQ76vbD3wZp7fD7HVNapHMZmAZ+raHk1Nc1+I1AjyYSaV57VC
         ohbyy3IaKNLw+dFMOwY1GIgky4mNElsNaFHu4F2/mOTZWItRcrlK4ZLJKWwbfHFS2qgi
         vdJA==
X-Gm-Message-State: ACrzQf3nSJsNVDYFSkyS3sDb1ngJt7ylS2nJ9Siv1eMmWTpsQVYoflWH
	RyHcJucM+u25LcfbKMNVI/lCbANs+EKzkQ==
X-Google-Smtp-Source: AMsMyM6NT0d0qq3+O+RKs8lVkAv+BEM4fJ8GH9Enq4K08G7d0IJ3hUXXUBc1RUNxwEs1RwMdH04dtg==
X-Received: by 2002:a37:7cc:0:b0:6fa:bb9:f9f2 with SMTP id 195-20020a3707cc000000b006fa0bb9f9f2mr34980422qkh.361.1667847897600;
        Mon, 07 Nov 2022 11:04:57 -0800 (PST)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id w40-20020a05622a192800b0039953dcc480sm6566111qtc.88.2022.11.07.11.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:04:57 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH langdale 0/2] arm-bsp/trusted-services: smm gateway
Date: Mon,  7 Nov 2022 14:03:55 -0500
Message-Id: <166784783591.2324924.6916746471535822649.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107114720.48670-1-emekcan.aras@arm.com>
References: <20221107114720.48670-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 19:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4114

On Mon, 7 Nov 2022 11:47:18 +0000, emekcan.aras@arm.com wrote:
> The SMM gateway in trusted-services does not return the right error
> values in negative cases. This patchset fixes those issues as expected
> in EDK2-tests.
> 
> Emekcan (2):
>   arm-bsp/trusted-services: add checks for null attributes in smm
>     gateway
>   arm-bsp/trusted-services: Fix GetNextVariable max_name_len in smm
>     gateway
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-services: add checks for null attributes in smm gateway
      commit: 5fd87e47f6d6ef4949123a2b21a6a4217b84ecc2
[2/2] arm-bsp/trusted-services: Fix GetNextVariable max_name_len in smm gateway
      commit: a41572a03284c13c31c612bc04eb6c34bdf9f03d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

