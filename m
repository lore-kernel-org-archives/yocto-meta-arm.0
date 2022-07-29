Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D29FC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:16:54 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.994.1659122208852951556
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=OD0aZmDf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id ct13so603102qvb.9
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=e02YZ/mBX6kY9uuczEtWNdzHy8hKzu0Q4vfH8IJdfA4=;
        b=OD0aZmDf8loCFO9PuFKIqJIkwAXR7nehCkfXn7G1NDWksHknLb43Y5Hw3p2wn7nvCF
         k2bvFP8RAdPz6hML0Sm/lescgDo6OgOGnT+sxpUZLetftl5xM34Fv6W0M6G1Xv7QuUPi
         GEaHzJ5JwAI/5KXFmweR+IQI8ljMSUAD3RFQU/tYH2RAPCe5yYEKtaKAgfByYH2radZP
         CDyMxDVFqCKMWWKR93KUdi+Qf0TA4e+0na+UfRBIW/gryo1nN3n+JwTkn6CQp+fYv+Ct
         S+L5EGsFtMUzVZ0wWcE5IK1Wf4YsuA7LvXnhUadbXIUDEby0vIoxVTEjH5Lhw1zIzJEQ
         ZNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=e02YZ/mBX6kY9uuczEtWNdzHy8hKzu0Q4vfH8IJdfA4=;
        b=s20qzn436UPKOhHRK4PZgK6FCFYofYUn237iu4lec9yLFJpUYqGjQ3q+WXe5DJWCrH
         O784XsQHxBps0/2kXCUW4P4D6pfoYhVnbpdlRJonDdlr7CJ15yNKb+jWIakTDaV22a+9
         LiwfpeTJ7mr+GRhqUcS7JSUApN17GSTpGz8LvM5wXwTY9CV6jyCamDydcsSf9zuESlj5
         VVNGoZqhdQptAmSZ/qTPmYzAnrpVdAhzKLNr7qED+vikopRXJsoUnKFdxhbjJbjzYdXu
         crY2MWOZAXwrXkaxNgWDw41Q831wMYjZt/U4dOFNbychLehvDjy0/IlUtH4uHWQrz3IC
         Z+ng==
X-Gm-Message-State: ACgBeo26n9HkSJUV9H55+BKSbxFopTo0k4ZCy1R95AMK/+xUj81crHAF
	efIMmZdj+qqVudR02OKg/5MXsnptRHIKWg==
X-Google-Smtp-Source: 
 AA6agR5ujyfM7nQ4As3f2XtaXxux3Az+TPAfNT+yQOnY1ZDZ2wZwp4Oyq8jtDumWMyJ8ftD4b5Khbg==
X-Received: by 2002:a0c:8170:0:b0:473:af82:9a77 with SMTP id
 103-20020a0c8170000000b00473af829a77mr4772941qvc.87.1659122207404;
        Fri, 29 Jul 2022 12:16:47 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 az15-20020a05620a170f00b006a981a2c483sm3114978qkb.39.2022.07.29.12.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 12:16:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/optee: support optee-os v3.18.0
Date: Fri, 29 Jul 2022 15:16:36 -0400
Message-Id: <165912219591.603629.5937648889014319502.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729162230.45859-1-vishnu.banavath@arm.com>
References: <20220729162230.45859-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 19:16:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3621

On Fri, 29 Jul 2022 17:22:29 +0100, vishnu.banavath@arm.com wrote:
> This change is to add yocot recipe to support optee-os
> 3.18.0 version.
> Also, move the SRC_URI:append and DEPENDS to optee-os.inc
> as these are common accross different optee versions.
> 
> Vishnu Banavath (1):
>   arm/optee: support optee-os v3.18.0
> 
> [...]

Applied, thanks!

[1/1] arm/optee: support optee-os v3.18.0
      commit: 1a14fe181d870ad63f06f34878b0aa8d887e25f2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

