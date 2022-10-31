Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A09EECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 14:47:52 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.10104.1667227664708412884
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Oct 2022 07:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=56/sToHq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id z30so7667594qkz.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 31 Oct 2022 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gG5cGTDsJmUpWGBJKcrCTjyssXWfUeA5WKFnBuZ+Zc=;
        b=56/sToHqfVV0/wNK6QFjkpD0lIgXk2PXO4BMSIcxIojAqkbLVIfAOuMPSzXbFDPtWv
         5xhZNzljMW7ztpC72Ojri2qEL5kRsfV1Ki+/UAIB209QAkGM06Px1Xz7EpqKXPaDNOB0
         nuJvE041SJ5LrQCVDnqmWhfaSc/CMn4lXrPxk+SP/juNKjoPzwYkab73ewsiAeWRAa0D
         R6/Kgg9xOCQA6RYhVJ27AVK6VPwaBcsYwAA0vbOv35yyO1g4Jcy0pBuT8G+iVQS2rBsE
         fo03zyozMZc4ZvURFVoarJibrjjJzPb6dKs11y+wOqdenQ6RjJLZYnJPhAIjtdp1GOrN
         gxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gG5cGTDsJmUpWGBJKcrCTjyssXWfUeA5WKFnBuZ+Zc=;
        b=ZOiQi6MpcwoRg72ayhe7Adz1ZekSDfZ6Q4OxUsELH9VO6ZyyuGL/seIcu0Kbiwme3C
         6xfx+Bm30KyAFHucwOnJ0sGj8kdiQzhHnyFJ75C0NTlWqp2oSSWzazhbX9Itk904G/Q+
         MjAzyuaheQAVUtv8o3peerlmFZ+WPQF2whyUS27owqTWQnEH/caY/OebnaDIFqBVO5Bm
         ipY0dbnRPU0MFOMnCMvj1V0wpfam/UFJmeGgSwSFaFFwN2dxMB0GSZ7Ca9umupysH77M
         r5qyCJ65YG8BaYh5mC39VtCNrpZZreC4Ml3fXXe4YxYatp5ACKxWreNTlJRknGMKn5HV
         k7xw==
X-Gm-Message-State: ACrzQf2aObwAA8/MjSpnOhaPJPzZYFaCXVrgZTBd7kYOAj8q64qXMI0O
	/hr7Qisr1+VFOfhD/StjU72YifK+s/b11w==
X-Google-Smtp-Source: AMsMyM6EMZvhpZq+SSc7dmLIkaHNqh70tM34lcjUjfVPt95uvpy7sz2UgqhUF7hp7MFB9UWDm+sCzA==
X-Received: by 2002:a05:620a:24d5:b0:6ee:d4bb:e5ba with SMTP id m21-20020a05620a24d500b006eed4bbe5bamr9600666qkn.457.1667227663286;
        Mon, 31 Oct 2022 07:47:43 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id u17-20020ae9c011000000b006e16dcf99c8sm4736479qkk.71.2022.10.31.07.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 07:47:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Vishnu.Banavath@arm.com,
	Ross.Burton@arm.com,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH langdale] kas: corstone1000: set branches to langdale
Date: Mon, 31 Oct 2022 10:43:28 -0400
Message-Id: <166722740971.3988070.3667498517665833374.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221028153922.16996-1-abdellatif.elkhlifi@arm.com>
References: <20221028153922.16996-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 31 Oct 2022 14:47:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4063

On Fri, 28 Oct 2022 16:39:22 +0100, abdellatif.elkhlifi@arm.com wrote:
> point poky/meta-openembedded to langdale

Applied, thanks!

[1/1] kas: corstone1000: set branches to langdale
      commit: 46e8092b6b780525b78e42ed01e75cfa25a58028

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

