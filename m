Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F676D3E788
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 05:51:53 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.39687.1730872305598573569
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 21:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Pqw1RfD7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cbcd8ce5f9so46386066d6.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 05 Nov 2024 21:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1730872304; x=1731477104; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WlsIAvNdBN8vGazMv8DLFjPUoCB19Otk0Kp+MPrSa4=;
        b=Pqw1RfD7+c3ZgFgUiQJ+0JKtetkESt96ZLTeHcd7f3ViZ/KKCLynoaX7rD8dWmPd4m
         2Qp3oBbfpYULUW0t553GGuC8lj0Pcqhu7EbJP0dl043y8cwR1qQQJWMaQI25EnMNwID3
         wi6TER6+N6X1DR8E5/BbROTtBsVH5m88suw6HPtSvPM2D0dg7XZdg113IitE5Osjjmd/
         GyAfz9LwRjA/j5pBBtQbUiKNBp6hgkbzFGY2dpfjuvycYWjH1eLJqxo0WMkRUfPhK4HE
         cg0bIMueG/laUB03w/o6/t9uizVSoDy497ZIQaiX/iipM/y4sWQ7bDCkVLJBaQagEDXi
         rYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730872304; x=1731477104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WlsIAvNdBN8vGazMv8DLFjPUoCB19Otk0Kp+MPrSa4=;
        b=eXiqqbTyTalPs5FRI2InYHA9bxYy36jbYWFAM8VHoMribGYIXs1u7+tLDvu7WNP/BK
         0OXvGltat1QKdRW3XoaNhLmv03EDvyLwYxi5SXwNO5woNpHVFJytRlToejGye3KEJ8y8
         7WfLKLuwNeSFcdARWLM4jPY1CEAY9edNR9QHMd5GRtnZ15HTxJ0PcwXCWwtUNgX3b/td
         hf3s0+ZiqtFWCEAkjPnNoLPfXSpuwnEG5LRrtb530VLVg5fAjM+QvQSgpqK4pL3fFcly
         uMY1X6Z55cFRXbLSRGHyg/7J2H6zMkF+zJ5RoQPxrC+jLby2sBqkSmQGRrwg+aq5qsM7
         e3ZA==
X-Gm-Message-State: AOJu0Yz/i6mUXdmXvC00tuT0E9143riH3Wq7IzINIAqj00lOZimjItXz
	zdj5uwY7H+BhpJYWJDt+PoP/DDh9QkcD4eus0iKvCQvXvU32k96Zi6t6DJg0BTNdpAMFULnqcts
	=
X-Google-Smtp-Source: AGHT+IGF2QekN8B0PwPLVFzgMBerX7t9V9hDH0F+joN4WfB9E76KKYTmJqvuDEfhWO7SpAw0BqYUHg==
X-Received: by 2002:a05:6214:3bc3:b0:6cc:2c28:2ab3 with SMTP id 6a1803df08f44-6d35c19b190mr285071316d6.41.1730872304367;
        Tue, 05 Nov 2024 21:51:44 -0800 (PST)
Received: from localhost ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d353fc718csm68517516d6.38.2024.11.05.21.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 21:51:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH] arm-bsp/documentation: corstone1000: Add SystemReady IR v2.0 certification
Date: Wed,  6 Nov 2024 00:51:31 -0500
Message-Id: <173087229577.1888529.17271807759623059594.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101132258.789596-1-hugues.kambampiana@arm.com>
References: <20241101132258.789596-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Nov 2024 05:51:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6242


On Fri, 01 Nov 2024 13:22:58 +0000, Hugues KAMBA MPIANA wrote:
> - Add details on SystemReady IR v2.0 certification achievement
> - Document additional patch added
> - Update release notes with new milestone tag `CORSTONE1000-2024.06-systemready-ir-v2.0`
> 
> 

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Add SystemReady IR v2.0 certification
      commit: bf9010c6849f7bd608fe1b6b6ef84650d35c3635

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

