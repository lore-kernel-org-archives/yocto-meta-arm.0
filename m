Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F070C54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:05:47 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.95590.1673633144077659536
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 10:05:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=y0AyoDro;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.174, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4b6255ce5baso295177717b3.11
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtSCMxn8+K/e4mcg3+5AktO9iObW9OiSjjBoUmBJxAo=;
        b=y0AyoDrokKypyR1zYF7siwYoArUD9XwH4t8FG5N5Nnno0ZaHfqGvsT/Oewl79epAgi
         N3hvvzKbIas8sGKb0tKe2xnt8Lh/Kx/ciUbjVNLJ7DSFuHZyQXZsZtHLe6SqkI6oGtC3
         JV3omnup9C2dK9jZ6ZKoqOYI1Is5mVOspmd0IwyJsCzS+FlL4P29+FMxzDwP4+1abhMl
         w9UmpaSIAyJSyITUoaldcidfXyL4TuZRKvAMysilmKN3xtg2KKAHx5HDHDXB9k9NRL1T
         MtIL2khgoa8UAorhUuVKsLSn6AE3xn2z+NZGDb7jmfpS6XdTtRmLJ+nV0o7nbuIgMjKF
         lgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtSCMxn8+K/e4mcg3+5AktO9iObW9OiSjjBoUmBJxAo=;
        b=ChT+j4T+MGe3m3A1Eqa6gI9fpN57VGx9QD/719rSL33+qG5RuEDXdq5iz1hL72078J
         9v67PNaHNqRYqIvX/fxhf8mBNgwbwVuQC3x0EJYXMk9SpFOQMw77tPMT4cMgeRr5PVAf
         gjXktqMfdru50nVrpt2GH0tX7rznOCqH7XAg8D0/j4/ksPyE8WcKwrfZn2mXfW82BzJQ
         U+RarSlfF6d86oYe2Ksa9+qovRUji50sWvpc0cURA8NVzoB0q6lbky/Zfd5xEecb18yH
         p2eOqIuKaKs3yb5KVXvPSo6hqKOBva0ePDVTrXMSZnpLJQ8aZuqzipSIhQk8E1PZjfoa
         8QGQ==
X-Gm-Message-State: AFqh2ko+xpiuSN+TujlswGuMWPf6HW3NMZlLY7x25on/jenxaQOYEcqi
	cpvShUF4MUJa/rzYAz7FmjAZ+0d3fJ1iFtlT
X-Google-Smtp-Source: AMrXdXtXOU5yvIOmoK8TOzqDIH6HW8ihqZVSAXb1oW9CWkb4XvQTRuNa2/x9caABHxzAT+udsWeZQQ==
X-Received: by 2002:a05:7500:4d0b:b0:f0:fd94:edf5 with SMTP id lb11-20020a0575004d0b00b000f0fd94edf5mr947093gab.72.1673633142625;
        Fri, 13 Jan 2023 10:05:42 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id de9-20020a05620a370900b007057cc1e87bsm12870836qkb.136.2023.01.13.10.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 10:05:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/2][langdale] arm/scp-firmware: Ensure CMAKE_BUILD_TYPE is capitalized
Date: Fri, 13 Jan 2023 13:05:29 -0500
Message-Id: <167363312982.997446.4433518533388135146.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111175929.1446440-1-peter.hoyes@arm.com>
References: <20230111175929.1446440-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 18:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4282

On Wed, 11 Jan 2023 17:59:28 +0000, Peter Hoyes wrote:
> If CMAKE_BUILD_TYPE=debug (lowercase), SCP-firmware builds with debug
> compiler flags but BUILD_MODE_DEBUG is not defined in C code so features
> that are conditionally enabled/disabled in debug mode are not active.
> 
> Pass capitalized "Debug" and "Release" strings to CMAKE_BUILD_TYPE to
> ensure Debug mode is fully enabled when SCP_BUILD_RELEASE = "0".
> 
> [...]

Applied, thanks!

[1/2] arm/scp-firmware: Ensure CMAKE_BUILD_TYPE is capitalized
      commit: b5fe2bf2b7295d258e781934b27f99e32ceee774
[2/2] arm/scp-firmware: Disable cppcheck
      commit: fd414c303c1cc9b2fa47001ab555c5e22ee1c5a4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

