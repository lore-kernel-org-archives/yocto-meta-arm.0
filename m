Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993ACC369A1
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:09:34 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.894.1743782967267213427
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 09:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Ci1xmpLS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476ae781d21so21728991cf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743782960; x=1744387760; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW8+E+8O7HGdqRM+bJIsvm+zbw+FP141jUYo11VOa/0=;
        b=Ci1xmpLSTcEX8Z0k2mWRduyNkLaJ4n3CmZPA5ZGeSsghPeOiShzasQZJA38XKeG408
         trQ+lHndHwXw2Q2+WTeOrXI9X4JIin9llHCkxyykOJ4771VUJ7v48VKl9X9P8t6EJGpB
         d7K1JqegEFKbP3aQVABuEDRKMle8o94KuKZYv5JqR1LbFu9cFFr4sQJRKkS9dumdySG0
         LaZwy4tQSEtbmqM4fW8dK5vhRre+43Dbyt3SDFADQDpRab0332ueIusA5VzKQq64qNYq
         Y/eyCesZzk5vUYR23L7XZ8UlYHpqk6t3OYdYk4JUwbeEoejNVW3lnUcu8y5grYYMHBih
         itrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743782960; x=1744387760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qW8+E+8O7HGdqRM+bJIsvm+zbw+FP141jUYo11VOa/0=;
        b=XVzvwe+YL5t/Y99vVs+ixf0MxbR3O9qQ2ddCX+nwh15aWA0lrjPM4PzKyZCN2t74ON
         2W//6rjGVTDojj+tUOkbnLuLE5/MECTKqyXH5jfV55lQG3RnV5wC786TfQNYXaQp0SBS
         wHIaiO/SMH10xt264+H6dah4+7v3D1h+MMYqeKtsHHCS118yrKlDslykAuwY29MhOQ9Y
         eQ3vyTJKM2YEkAO9cIj5BZDM0NHISixBWVeARf2cw/hubOmp7GQcAQa639XqNdLiN92k
         p06t/+gDN/6hsq7bllWr24YIjiqC/u+KzZ+7K3yTgVhn4/Ml/IvOgfBOaMPhl9MmIjB5
         8DpA==
X-Gm-Message-State: AOJu0YymhYPp2wwX8J3exjwanVkwt8PLJ7y1DNe1xiv/DzbFIWjkst/m
	n7v5GFwTK+rsXjyl4iCdih7vMsUecvefdoMqk6rbdH3hc6A7YMugvIBMEW0T1Wxk7Scz5SIvfMy
	pAA==
X-Gm-Gg: ASbGncvdQkrP5+BSqRJY/8qnMS/k8xMGqq1hH50/A6CyR8OWiFNzkCKsEg5EguRCZwo
	pv8ws+Isew+AJrhvOfWo3laof5I0f2JM8M4hnJffmZKhaLqavXfQ59cL3YdOLY5dpN8QZMyfCG0
	gPgoMgZr6Rr/ahDj0LX8yX/OecfJkmuvcvQUvBmD1b1xPWW8+MD5xRy1mq1W0TgTgildff6AqNp
	DkASDykTBKszyZg/I8DUjgQHvMyGqH3KJXzue2FoPbW27ugE9EBxWX6KVcmQ/OrTCsN5RjRbycH
	CTq8bU/n1/DZ2Dc4vIy3jecIll26Z7YIUPeF
X-Google-Smtp-Source: AGHT+IHYAit4kp5yvoHE0+mF/iEv6iqjPJq4Z3qbfrHTW+hq6oae1uDtpD1iq2AaGsO8D+Uh7mtKuQ==
X-Received: by 2002:ac8:590f:0:b0:476:b2be:5894 with SMTP id d75a77b69052e-47924919195mr63619891cf.13.1743782959673;
        Fri, 04 Apr 2025 09:09:19 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b0883e6sm23622551cf.37.2025.04.04.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:09:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Gyorgy Szing <gyorgy.szing@arm.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	tom.hochstein@nxp.com,
	sahil.malhotra@nxp.com,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/6] optee-client: use udev rule and systemd service from upstream
Date: Fri,  4 Apr 2025 12:09:09 -0400
Message-Id: <174378295340.1062697.9943234236229279560.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250402141652.380180-1-gyorgy.szing@arm.com>
References: <20250402141652.380180-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 16:09:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6445


On Wed, 02 Apr 2025 16:16:47 +0200, Gyorgy Szing wrote:
> Use backported upstream patch for udev rule and systemd service file.
> sysvinit script is still used from meta-arm. Don't install systemd
> service without systemd distro feature, other way round for
> sysvinit script.
> 
> tee-supplicant started by systemd service runs as non-root teesuppl
> user with teepriv group. sysvinit still runs as root since busybox
> start-stop-daemon doesn't support -g group parameter and -u teesuppl
> doesn't seem to change the effective user.
> 
> [...]

Applied, thanks!

[1/6] optee-client: use udev rule and systemd service from upstream
      commit: 7bff82fad6741a53b66a1f9e5383a2bb2cfa1b8f
[2/6] optee-os: add v4.4
      commit: e5acba7ff2edbac42da5c9b4e53e7f689430fe02
[3/6] optee-client: fix udev and systemd handling
      commit: 4e28dd5cbf416692077d90162ffdec25515386d5
[4/6] optee-client: drop privileges of tee-supplicant
      commit: 1c8f1c26d181f0abe7aef3a04a63979087a7cd28
[5/6] optee-client: use the same tee group as libts
      commit: 0b53fe990fc91b74f66092799495e9b05560f34e
[6/6] arm/trusted-services: fix udev management in libts
      commit: 22d0f3fca64a2bf516c8d08bc825aa5f5a9fafe9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

