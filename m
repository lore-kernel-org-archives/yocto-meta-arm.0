Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B2EEED61E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 17:39:58 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.27814.1694799588388080294
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 10:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lSr8/YIi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-656351b6d74so4441176d6.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 15 Sep 2023 10:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694799587; x=1695404387; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gV4zwfVckiZvwczKvvml9iFWPlySvCVdBA3pYERuWpo=;
        b=lSr8/YIiYYl5KIpU6Nf8W0SoyLWxWdUBG+4r4uk6tYZ7EtbME77FNn+rzPF5WqBTPX
         B/TDIxERgMze2qBkSJHDXo/KTxVNTLC1MUPHQPI7o9SmytBf3WhV3ZxaSYBAk6OxZx7t
         0JVIjTFkpCSsf/hG1GEjfqe9IDcDhPNbeLWH1O1ki79nFY2qhFUpImPh9H5QfDQbRP37
         pw1BW12gtndqmT40jF4Yzg8unnYw59Dsq7IzYlRxSPxzjCgkLCiaZ+avtnQnlKYOrMeM
         +nDze+tMvSI8lEjESZ5B1+GmW+tuEb+I2PzUR0EmaBezkFf9SdR+xDkp5ivgnvE0S069
         DGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694799587; x=1695404387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gV4zwfVckiZvwczKvvml9iFWPlySvCVdBA3pYERuWpo=;
        b=BJGX+H7JwN6ejL8qqtbsR0cJqW2e3Lb84gQjeQEK+zgltnProoGeBlLM8R8yGCMpWH
         MTy6eomvG8Fpqm7j8Wfq8NoriBKAZ3eUVFUfv1/JagMeQbiTLBHWJ70+vl2WcoCKvLwW
         hgHRPw/W39PcOHb3zlZ3zi9TWlYZfnuyBLnXJL30sZOYDtCpNYpNuHj+f79jlS7TVwzd
         KZvAinxyvnTT72VkaUn7wZCd03C3OLnQibfCFbp+lVSG+yVVYIAG7IXdKgDiVyaQcTam
         tvuQah2PhwZhHMlSTRG1A74fJeW/sbZcwu8M9qxAF4EU4OIt3D3fBENLhJz3kgKm9ao8
         BFsA==
X-Gm-Message-State: AOJu0YyXAoMG5CUYorWlu3OVtGE/FhgW2yUVps5s4roj1UFNbgmRy2DM
	35KMOpcHwo0nPG0YxGlLoNT3LB7M+FnJV6/CXBI=
X-Google-Smtp-Source: AGHT+IFGAmCGUyh4zbSFhhxsjkS8SfCmYr3hwdM0Gdpct84XYhAz5ZtGSz+R+T6uHrC673g169StMw==
X-Received: by 2002:a0c:e003:0:b0:64f:9333:13bc with SMTP id j3-20020a0ce003000000b0064f933313bcmr3273964qvk.23.1694799587097;
        Fri, 15 Sep 2023 10:39:47 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id u19-20020a0cf1d3000000b00655e4826738sm1427209qvl.31.2023.09.15.10.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 10:39:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/edk2: update to edk2-stable202308
Date: Fri, 15 Sep 2023 13:39:09 -0400
Message-Id: <169479955106.423322.13003797988883551760.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915001220.3766492-1-jon.mason@arm.com>
References: <20230915001220.3766492-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 15 Sep 2023 17:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5052


On Thu, 14 Sep 2023 19:12:20 -0500, Jon Mason wrote:
> Update to the latest versions of edk2 and edk2-platforms.  This
> necessitates updating the patches in sbsa-acs to apply cleanly to the
> latest version of edk2.
> 
> 

Applied, thanks!

[1/1] arm/edk2: update to edk2-stable202308
      commit: 75fc079970f53c4582cb2db2812d01fed5b54c81

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

