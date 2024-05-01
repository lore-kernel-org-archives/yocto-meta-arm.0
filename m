Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9EDC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 02:06:57 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.3215.1714529209007232251
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 19:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=2S/VAv5Z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-434d0f63c31so40737511cf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 19:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714529208; x=1715134008; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4yF23nCWBX0IG34Izw7htl5/VXO6BJmd6WqBPyXkr4=;
        b=2S/VAv5ZDd3VESu/EO3UMIcFnXE6aCGpvXFOR4iYZ6waKiDEx+mmzVhHRuxGR/nu6m
         uKVraMtzkyVzb1HsTkDZBGtkFir+4a875o4cVPpTUt/9UJkt091tq98reS/+u8q6QuhQ
         3Agl6qKoFlli8qBDkebro94ZSgcOk2BfUX5Ej6wWL32R8OH8z8IJZDLa4Ohmip1uUm84
         JCg9SuvwUM7x3LJkJvlK2zBlZ/UjSXHiK1NMOXawB/uyOVdGYAKefnOz3A+W5VPv1dYs
         pHJdvUoicYRxODVGBFFE51BbBF+YzJfN03rrzosIEEI/XhqKbsrmZrLcxIivZzsnswh9
         EsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714529208; x=1715134008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4yF23nCWBX0IG34Izw7htl5/VXO6BJmd6WqBPyXkr4=;
        b=gs5ciVjs+3qgWZ4W8JbYiFhEN7XSvXl6GF2lv7E7WIzL/TT+0MVC8nnxG6qA7lyAH/
         1ht0aSfcM/zciJjf+M5DEaSmMDCph3KNCH5Jcfzzg+0fBdw5R+w0e0LNfDKNqI4/0cp7
         5qY8PzlEsBD/715paEyHJJI2ah50CLmfUbPk7JPEoTV6vbI18sEuPiA8LEM1IYvKH6LW
         dVln3vlmXkUsCTZwrjpLmrzDczMrdxC7Jcq8pgQuXZqpbYIB0gs8MxHMYj7Eoq8GTY9/
         n1jqYjaqxrllTkiFPIqyRMRi5CTKzbPy/Xt1rDQpWDpMX0WZ1PwJPUi5uxySns2PynQE
         1Z3A==
X-Gm-Message-State: AOJu0Yz0wZFdEdu8q57Nnr4tBLLGdgmdIF3INhFLR34x3WXvwbBoxgYf
	KPWxjXkE8rpY63AIbWcxS4o8PZAf8Zxn+nKW0E84RzODNSJcxxsM4eLDHajcWgmzn55wKb9Pqv8
	=
X-Google-Smtp-Source: AGHT+IHhoL6cEmtNYMj37iibyXKw339404GS5pMJ8xqRhlO6x70klN9pIlTfl+G4r1N0wLyvfzYUWQ==
X-Received: by 2002:ac8:5e10:0:b0:43b:981:7666 with SMTP id h16-20020ac85e10000000b0043b09817666mr1065057qtx.68.1714529207820;
        Tue, 30 Apr 2024 19:06:47 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id er14-20020a05622a5e8e00b0043af8341b9dsm2086733qtb.95.2024.04.30.19.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 19:06:47 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	adam.johnston@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: Use git clone to fetch FW for the N1SDP
Date: Tue, 30 Apr 2024 22:06:38 -0400
Message-Id: <171452919798.3441672.7600284770990829301.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240430082413.1131081-1-adam.johnston@arm.com>
References: <20240430082413.1131081-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 02:06:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5672


On Tue, 30 Apr 2024 09:24:12 +0100, adam.johnston@arm.com wrote:
> From: Adam Johnston <adam.johnston@arm.com>
> 
> git.linaro.org/landing-teams/working no longer seems to serve snapshots
> in tar.gz format, breaking the N1SDP build for kirkstone.
> 
> Using same tag as the existing snapshot, fetch the binaries with a
> conventional git clone, as per master.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/n1sdp: Use git clone to fetch FW for the N1SDP
      commit: 668df530a50580927a147fe633187cd8ae0a72db

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

