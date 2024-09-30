Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CEFCE836B
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:25:42 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.59014.1727713536815963786
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 09:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Z/rjbQr7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.176, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-68518bc1407so42745567b3.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727713536; x=1728318336; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtbBaG9CvYGh4WmbbPe1mZSY5sC3z2uQWKdbwVeYlTg=;
        b=Z/rjbQr7bKTW3RaGQcnptIWrjybrPxU8ruYW+ipPalxrOLyFNca9XWsMT+4DvjewqE
         NHdX0bFUsU+rjG/lOUyVml+I7G/wHFxuiPZc+G5d/hBw+NfqgvO0f3wd/QkTfk2dKvQS
         55ZbGtrxhu9N5mK09ke/Km+lnY3HtuMR2sebaUhrQO+TfnR47DJSprH/KWD8EuF223+m
         KrQxcR2ddf5itSIBXAwv35uU+wwWDOrgqb2kqrpyP4XYAmS+84KENaTRFO8ycfOTloTw
         IJjiHKa8WRPg2x1ChWQNmAvs301+JsjWvcbyrmZSxZ2xSd64Y73yBaxuitM5OXJlFdyI
         c4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713536; x=1728318336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtbBaG9CvYGh4WmbbPe1mZSY5sC3z2uQWKdbwVeYlTg=;
        b=Ai8osLOmW2u/51BJmWwSopqrmrHh6MH2mafUMti5Th5v878dzSVVgnJBpLct8zHly/
         n8C6yD0PWsOD6XZNIPa44wApdNRxt7C8Q9dO49Rj4pdHYU3BSa94MTPpc+MFaJbRERVO
         KJLw4L5Z9tCqc63WnXZxbdC+0JPiZ30SGrM1PoButy90oDadNONbj/kuViK1TTJIAn1J
         e1/AHiMLLxMFy9wwuUWihLFCdUl2MJcbZZ/Ca25fJukRMTEL4uekoMa3Nx/VlY5Wb33a
         CUdiUxQnqMaDW5P/IlBsfUe0dqvxqMvOk0HXsOvhq+rnGr5T98vKTGHT339inQQG99r7
         Pezw==
X-Gm-Message-State: AOJu0YyVhktay+f81gjcKXCZXVlSx4gOKSgc2e8m4Wo9AMzDp5PF2wtN
	HphS6YGpWjlaM1KceWkkdrvwEq2QwN/ByyfqEczAoQu6tH8enJixFc8AzRCBzPWl1X6AkY+Ew1E
	=
X-Google-Smtp-Source: AGHT+IFEGN/a/JXH/iWfuLA6ic0svLyPphR9i4brGxVHcyHH5SFR6VtZI3yCyweWaIiuGn/xCXaV8Q==
X-Received: by 2002:a05:690c:f0d:b0:6e2:ef1:2555 with SMTP id 00721157ae682-6e2474d956bmr102684027b3.8.1727713535675;
        Mon, 30 Sep 2024 09:25:35 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24549d3dbsm14653247b3.135.2024.09.30.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:25:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: switch to building against styhead branches where possible
Date: Mon, 30 Sep 2024 12:24:41 -0400
Message-Id: <172771348140.724488.8426565593028879368.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240926200533.1870444-1-ross.burton@arm.com>
References: <20240926200533.1870444-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:25:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6148


On Thu, 26 Sep 2024 21:05:33 +0100, Ross Burton wrote:
> 


Applied, thanks!

[1/1] CI: switch to building against styhead branches where possible
      commit: 2b1348d74f9fb4e49ece3a8a0107307ec432f392

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

