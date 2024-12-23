Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDECE7718D
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 05:45:51 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.8872.1734932744290963551
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 22 Dec 2024 21:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=hHXYwduz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4679d366adeso34449801cf.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 22 Dec 2024 21:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1734932743; x=1735537543; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJ87e/pXwM0B9MS4CA04+lpscX9ZCQ/ITez6341f+D4=;
        b=hHXYwduzMr66deYpOZV57ET3Iejy7RpAS3ANOZPhu9tqdriRKic4EjLU3UIu3z99DI
         7MJlklBnMK1TGN8yVkU+EK7Neqm6mOjh++LRXeCPlhQZf06rHIgZHgnYm1mDpqOZP75W
         z5YZdg6blPLh6zHDYFmXvBYsqB+aJO2iyAudGLrlyBX6gkXwVEAxZDjnjpRO0d/kmb1K
         fFLSJwxvCfBH7awzUsP0jz2MYT1Jv1yXe8it/H2hZQnU45Ip3HC1VKlGnl7uf6CV4k69
         HWJ+n8Ng0bY+w1qkSW7rGeR0kZWprmOPQqzsGXLBKBSRcOA5ZDyLFblQiG3OhwX1ZOrT
         2Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734932743; x=1735537543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJ87e/pXwM0B9MS4CA04+lpscX9ZCQ/ITez6341f+D4=;
        b=GpHXCdlFsCKUB+9LSwWmSO+pYiEUPF6spQGIrnDXg+72GPgLIf/V/B66tTZGzuiiWG
         Ak4wjJCwH/hkUDeP3hhlq9xU5Mf8nFf4R7RSUmdsa0/3upKLwKC6ExfHRI0Bb78zvT/Q
         SnvzEfAtQ+UbAWrSlpqx5wlKFe5H8RujNOQQwnrPGNc959bM8BUmrpKh3+wBMCRyYUo4
         nv3n7MxRFq+rFPx7CmfjEQKqH5o3Ou2NkxUw3uuAqpTlRD+fzfpCCHAlEMes1XYvYjRA
         m5tV3kVXoWvWa85u0rfp5GZUAeGHjGs7SXC3u+cJon176MIi3PoVncb0gYzDpd/maNIn
         nC3g==
X-Gm-Message-State: AOJu0Yy/dkxIgUtvneI2tIvkBraGD69THOzoQ3l0MnP7U3WDkYnslmF3
	Kt7z6rtqwYFgMavk30yrND1BLVKInwUGXWnb8pGenmgTRxmBXqITTJV7q8LOer4j65D7pDcbiHA
	=
X-Gm-Gg: ASbGncuCsLc/b2U0s+u3+gKeJ+r81FYn4EYoHtueP408UM2ebVO6oj9OjHLS4bS7X9F
	RedQFQWsia8CdLCdeuhKVZEi9tTFMLgkgspeG433IeSvMWBD86FobVDZJftLWGzrBbGRKi7cduA
	cxOWF18BrWzTJ2/bx3Za72VtrIp0dvT16IfVMSOMOLKfmo4A5ALqT2ZK/zOvq0IpaSc6wzDRUTx
	J93iUqaTyd5FOb5qN7GXna+dcpiWTrQGaf7EJQwDddV5BWV
X-Google-Smtp-Source: AGHT+IFWyQmlEdYwslFGfYnkfGAzikU9jmcJaD6fydWDgEDbFEdQQljHhdj0XZky7TZ2snXHb1SsrA==
X-Received: by 2002:ac8:5a41:0:b0:467:84a7:f312 with SMTP id d75a77b69052e-46a3af9e785mr240681951cf.11.1734932742932;
        Sun, 22 Dec 2024 21:45:42 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb2b550sm40987461cf.81.2024.12.22.21.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 21:45:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Subject: Re: [PATCH styhead] arm/lib: Relax "Listening for serial connection" regex
Date: Mon, 23 Dec 2024 00:45:30 -0500
Message-Id: <173493273018.1347092.16162678949631456270.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218102304.3034598-1-peter.hoyes@arm.com>
References: <20241218102304.3034598-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Dec 2024 05:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6301


On Wed, 18 Dec 2024 10:23:04 +0000, Peter Hoyes wrote:
> Newer versions of the FVP now contain a full log entry for the
> "Listening for serial connection on port" regex of the form:
> 
> INFO: FVP_NAME: terminal_uart: Listening for serial connection...
> 
> Relax the regex to support this new logging format and change from
> re.match to re.search as the regex may not appear at the start of the
> line.
> 
> [...]

Applied, thanks!

[1/1] arm/lib: Relax "Listening for serial connection" regex
      commit: 5adb3155179b1b618a4c59911ada7659e1bee619

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

