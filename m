Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7C3CF8853
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 00:14:24 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.2715.1728087257507468741
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 17:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=f1OP1vnh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7ae6f4b1f16so107042685a.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 17:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1728087256; x=1728692056; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+YXPPu7VTApN1NEqYLLylLfZF/1wRCFMPvwFXFD0YY=;
        b=f1OP1vnhLbhnDoxhs9SB8i09CmXVeRAtuNdrDWzShTKg8xo8wVn/+fXlDo/wp/JfQQ
         8he3sVINgShGcMm5Fk/h0SUKMZ59CHxynYIF0wcmJQKVW/CFDAHcEqRCxFvOSQl4OMD3
         Gd2zqZvkZHtKx8juUewkNhd71ZXtfA18hPbCChtK6wWBnYARSbOotgmRcEOb8RnYyU2/
         osrBRSO2PEnLe7M6EmFAbZsHXUJYzZXxFcV63oGdRmNyzerPKm5s1VVkjkB/nXcCvDtv
         Kupd5lMrffilMPGbvrF0bDKAHoOxjAd3VPbq9wlDzXQ2sIzKli5OPyCVxwhZnow3HD0C
         CNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728087256; x=1728692056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+YXPPu7VTApN1NEqYLLylLfZF/1wRCFMPvwFXFD0YY=;
        b=Frxb6lJvf3YNK1NuEhEgRF6UKE43Cjs4S4U/9fYvaUVGF6ae2ZggHLEHE0McL0XEOj
         3VJmcP9UsmtpYIdvtvOPoM2jgVRTEdgI4UbHaKEta5TKH1GxoLOQTkepxQcgcjdyKFjN
         NEqGeDD4W5fGFMrGdMtBKxxDGEjw1wGPs+QEs/NjcwMJRvwyxrg+iJ6Z1MxTxv4Oie7Z
         U/+pGTQXyuEr1gzZZ5wzmk+do0gaz2zfO37QaA1LVndW+vnnuGwKZkYfItqcgQRsRmAl
         HdAgaqWLOT2HmpHgQc6xSsI0+gJlvyOJESEU51w9XwBMG39Qj/oYbbdz/SKkFEdkwxjZ
         WY9A==
X-Gm-Message-State: AOJu0YxGeDd49jCO36zDGZTMvVBsp3ftkxmVPBr6wDIcq5uChOuPI30F
	VrQIb+dIpmeg89gN6sSyVIMOYrHklBYQOB6eel4P06+QTqv36kDQsjNRzUuhZZuWIm0fBhf9IZc
	=
X-Google-Smtp-Source: AGHT+IHoTVFEtewAj2i8YxPwNrH7/uHwh7YhNq9HqG3oX9hM165QiVwcdVhu/MR0j9llyjV70zr/eQ==
X-Received: by 2002:a05:620a:4103:b0:7a2:e53:3f5d with SMTP id af79cd13be357-7ae6f4ae00emr641960885a.66.1728087256332;
        Fri, 04 Oct 2024 17:14:16 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae756615besm30894985a.76.2024.10.04.17.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 17:14:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Javier Tia <javier.tia@linaro.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH v8 0/2] Add UEFI Secure Boot
Date: Fri,  4 Oct 2024 20:13:55 -0400
Message-Id: <172808724076.599143.4816976800229723262.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241003213330.627644-1-javier.tia@linaro.org>
References: <20241003213330.627644-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 05 Oct 2024 00:14:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6173


On Thu, 03 Oct 2024 15:33:28 -0600, Javier Tia wrote:
> Addressing comments from patch series v7.
> 
> Introduce uefi-secureboot.yml as an addon to add UEFI Secure Boot. Most
> of changes are backported from meta-ts.
> 
> UEFI Secure Boot requirements:
> 
> [...]

Applied, thanks!

[1/2] arm: Enable Secure Boot in all required recipes
      commit: 21d2e50358604c039eeb3935c051c90dd7504a26
[2/2] arm/qemuarm64-secureboot: Enable UEFI Secure Boot
      commit: c9057f9ea1671469c7786b38b3de8fbbb9223459

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

