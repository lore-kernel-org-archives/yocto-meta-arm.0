Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8370EC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 18:10:53 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.2843.1698775845340953371
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 11:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=2t6esvg7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67131800219so21562876d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 31 Oct 2023 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698775843; x=1699380643; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70imZIZB81AX4JwA+4zuT1MnWOyyBta7QB3DGRT5pSg=;
        b=2t6esvg7mOz40uncWV7M/k2ZOE5WV9XMfW3UA8YqLcMQj1lxrCkIfXgYmpS0+jG5Xo
         vmB9qBSlCmDwfx/uAbzofc7a7H4wxoTHlcji/GP+BGNDFWXH7/PsQhvdSje2T92BYuwD
         XBN3iM+4uyOLQOdEBuKym7khHmcGs7lQpAzF98/cluMYEoCunfdCqNLDWcZvfzwCotXE
         Pc05oCEPnihbuQkItWRY9JL5GXx9y2csC3CoHEhaw7erVHAzbk5gxb/XozCvPN8LyNLG
         R5+V3BjvbpaUpToS4Qk7WUlAkG3wGXbxckd0E542y0RRXeUckVuvTq7eH5bkZ09FvnQj
         g70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698775843; x=1699380643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70imZIZB81AX4JwA+4zuT1MnWOyyBta7QB3DGRT5pSg=;
        b=k8jDFwtHeF2RtXO4wtKQAjDESQWekmt5ogm7Y0aCCtNetJoDpvTWIIbZh0jT/9Y+WE
         CQhUmBPIoyN/m4nRYBIxiezqatq3f+Umc45wOpjjk8Wj562+6kOKqFSHfwzc/+jKJkP0
         4xD/9yCqzHjpZcpRLzi4ZTpybKCZ65qjjYz8ifwCTTTpamDsGSZlu2iaeQsteeXPVK36
         LWIOOTaXHgXKsGLyY3KUZdMzhkdo5EV1vJDj7PMxnDVxEv4mRw9jjQm7OcRSVQu+TnQx
         WkPc9tHl2/asfT7hVrzSl98QzL/nzbkSlYLsf3sJhkBjwj2BSGW/k9REw3jidl9vIHqz
         FU6Q==
X-Gm-Message-State: AOJu0Yx0qN5wqpBqoiyBrZITBaNp+lyiWvpLUAQBcG9hNBIvZSEfZjPJ
	he5S44SjPrGO4LkocC376toa2MKqHHVr/idYMSk=
X-Google-Smtp-Source: AGHT+IFXFwP8onpk1kCVbgHVMEHRqHs+FsQZqx/UccWeDXU9CCR3e0080yEfRHewo7L8BqutS1Xf7A==
X-Received: by 2002:ad4:5c88:0:b0:66d:1b4c:e867 with SMTP id o8-20020ad45c88000000b0066d1b4ce867mr21621282qvh.45.1698775843466;
        Tue, 31 Oct 2023 11:10:43 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id t11-20020a05621405cb00b00670867d7bdfsm734028qvz.122.2023.10.31.11.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 11:10:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/hafnium: update to v2.9
Date: Tue, 31 Oct 2023 14:10:14 -0400
Message-Id: <169877581528.1610178.15040478594967428758.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231030141918.3961840-1-jon.mason@arm.com>
References: <20231030141918.3961840-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Oct 2023 18:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5189


On Mon, 30 Oct 2023 09:19:18 -0500, Jon Mason wrote:
> Updating to the latest version of hafnium.  Also, dropping tc patches,
> as they are either experimental or a similar feature has been added.
> 
> 

Applied, thanks!

[1/1] arm/hafnium: update to v2.9
      commit: 26586c3d7c3e14e9246a53ff94d8af0dcac0bf2b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

