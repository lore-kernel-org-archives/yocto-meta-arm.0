Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5A1C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 04:23:47 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.41095.1747974220244003493
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 May 2025 21:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=nyqR0VM5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476ac73c76fso125703141cf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 21:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1747974219; x=1748579019; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbN8EeWozn2JL5rtX0jFXudZzpUU2DHnXAARg+trHXM=;
        b=nyqR0VM5si37h46ufZog1YHSJ8KCY+T0uHRXvHzx5EI4kn/Ex1oeQPcUSN5bLQWH40
         5Ft+bO4QC9TCHBhBXMhUtPEBMTNtHbfqTBW/8xoJK5qA50ZYQZG2yH6LQuPM2PONoQzW
         rZjiA7RZlGMEYzsYKeOfFvY0yheGAHNxKGreayGFAFFiK8BXiFmgHQanjicNRf175Ddu
         JIxBfREnh848DePiCa1mLmEfkWmprD06b4whd1tlohmFf0Ost4AOyuIPcN9kK4VBjt23
         gkzDjBgbcASXfeN1+jJHk1LR4q34SgQOFQLwYL0VbaSRSHLReKPlNv4kMBXkuLXaQ10y
         wnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747974219; x=1748579019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbN8EeWozn2JL5rtX0jFXudZzpUU2DHnXAARg+trHXM=;
        b=vHM28J13+MnNXGQ9aJbKXtJ4S/Arg8kkmTMqo/qplgmfwE16mNBdEYLkUGjBk80OkA
         fCyZy8+cxY+fvJ8eZrGe1xNTKFtYfOk3c0H+3Nthne60rRlOS7b6jd/j8GRHJuQFe04P
         /lW2qEI11yVu+l5zm/fOCRGR3Bla8FNuAmz5QMAo3KnjtkqDKuqXoL5y7h4zswZAQK0f
         jZCcb55jcDN7Cg07j/7A86VKvshQuEIxHPqwLzfSUKYEPaAxLN+ija5icbm3+NUWp1+7
         gVBxyjcSdltWpW1WKHgUhbQUio/UXXDRiNR6Nkd0+kFKVAQkE7OUaDkO6S/L/GW+RXkR
         xflQ==
X-Gm-Message-State: AOJu0YzN/afq7XKIPvzsVcmQDhP/G0lAmT2j2d2+AnRAU1DYaCvSU3yG
	+N7uk7JYB2fHtOeZF7afHcpVm3v8a70zcjPrVhlJHAE98YpkkNNZVs9QwDE6MHAYvWX5RZ5C1dg
	PicZQSQ==
X-Gm-Gg: ASbGncv0rXURV9TPhkCpNTZrkWc28OoVL5/fGjByhD9rXd9deu1XT9gM/WmkkLgKKap
	XB53wQHrH1+o91exdc2pvUZtnqmI3H/HWBWzGA775OMWiW9yMSnXtTFgsGyUK/CtMGkWk2b6VF4
	QxI85isQ6tJB+v+zWgwDNo57xEJN894CZpCZEljRZ4akjWT9HJPNT+eNAAwdUE2QrMLR4qao4kY
	OBqL66ldC8JKwfb7ED5pi7ZoYmJgQaeEbbbU3UfNe18VgL5/xIaubMrk2YXgBOlJZ331y2wmVXG
	Pln59IvJo6KzxRgH2Umtj1TQUm86GMzMKJ/9wYNd5K4=
X-Google-Smtp-Source: AGHT+IECp27NeaAjowTNPWqPX7kORLcEiFL5jYICrGBgoZoPC1eQj7L4AvN4r+9zC1wxroug9i5KjA==
X-Received: by 2002:a05:622a:4a17:b0:49a:4fa0:61c9 with SMTP id d75a77b69052e-49e1da443f7mr17138161cf.10.1747974218992;
        Thu, 22 May 2025 21:23:38 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae528466sm107838561cf.67.2025.05.22.21.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 21:23:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm/fvp-base-a-aem: upgrade to 11.29.27
Date: Fri, 23 May 2025 00:23:16 -0400
Message-Id: <174797419804.2415316.13465216842111848404.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520160545.2283646-1-ross.burton@arm.com>
References: <20250520160545.2283646-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 May 2025 04:23:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6522


On Tue, 20 May 2025 17:05:44 +0100, Ross Burton wrote:
> Notably, this fixes the need for an executable stack.
> 
> 

Applied, thanks!

[1/2] arm/fvp-base-a-aem: upgrade to 11.29.27
      commit: c9f712b08116cc8ca37ed8a7e1d3db9049cfbc0e
[2/2] arm/execstack: remove, no longer needed
      commit: c550fef75d44fc25be644c8fc4edfdd337b36a65

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

