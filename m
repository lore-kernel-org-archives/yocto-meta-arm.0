Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0E9CDD1D6
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 19:22:13 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.64082.1727724130297076791
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 12:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ZbWF6wMi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.51, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5e1b35030aeso2780776eaf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727724129; x=1728328929; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pxPe6liHCQsrCyFfy2uZq6SRX9huOuuUBJCVPflKCLI=;
        b=ZbWF6wMi05PESCTNuHqtRaNAw5TS3nE3DT0p18Mh5FZxI05hMD0qbdC/1sDWMtZy+v
         Kftm6idQ75pfAdG3BFO5k1AR2/jvHV58hc2YHVdty1ZS3kw9jhaqdAUs2HgBEVkCX3bZ
         h1vypGe2sccAwWAZt6Pv24yc16D9mOo+dexISgVno6At1f+SlXvUY76DA5PJM+L1jxCJ
         JhhoVFpLF7IHMfd/pns8X3idiSIsMuavtXmVGvs70G9qv7v2MrieQ+oZh+ymUJFK0oyM
         aBJKz6BWlewSZJmhHgRifpfyXJ2RqbShTKN5q+rJZHbz8sj4mVJE5YyRKrl9t41WGcLL
         7Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727724129; x=1728328929;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxPe6liHCQsrCyFfy2uZq6SRX9huOuuUBJCVPflKCLI=;
        b=YdiU6hK00ckch38W0mu5mltUcnj9UrnddDAAqItJYUBC8y4r0JUSsyBc7EqPEkxEPc
         1pW0sN0BxEGkZBW73PWDSzBB51sVW6GD7ehjvKXiev3+8DbXTzkilSo3Xy/lojea1qfu
         TnBsnppNv4NkjLUCb4nwEVTip85oB66wRU6n7xMUS3i9wMNJobAsWk1SZfz3XV200wQb
         3a0StnbOx7TIQjpsTHOuVVVsA5bQaUu9/6awRWQqQD8ZpAZbKDab3n4AKhN6XmpSm/SE
         ZaIwQXOMwDraWsnXZYgU6jZrnmB9/dlIoOgbEOg5fzTqjRRqP47DjQA03EQ9MLlZW+82
         lwVw==
X-Gm-Message-State: AOJu0Yx9/zHODklOx1MYGr+u94JWfiwzH6TyIYq2Vufk0ZmzWYvQ54LP
	8+F4jYXQq6YpJi1TnJ002DkRl/ngOGRZq2jWzrA4YdDH7fEL+peG0NmSyeEXPsC8NXh89B21JTO
	PHFT/JWdZmw6pj3ogLjZ+FTT6fbKoa5K/NEz5ThOdOuaPdCBvFg==
X-Google-Smtp-Source: AGHT+IH+BBmRgcJIh60hk+hfJkbsQMpxlvJhObjJg7UDtEgvDwMmAVtjR3zevbUdEVma6MUQtMKDlzXAGFAJIWLsv1A=
X-Received: by 2002:a05:6870:3c15:b0:277:fb54:5a5 with SMTP id
 586e51a60fabf-28710b9df2fmr8717085fac.38.1727724128744; Mon, 30 Sep 2024
 12:22:08 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 30 Sep 2024 15:21:57 -0400
Message-ID: <CAPoiz9xGHpme6xUcZubvk-_B16emaWVSDfj5XbvR=E3XG4p4LQ@mail.gmail.com>
Subject: Styhead release this Friday
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 19:22:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6149

I've forked the styhead branch from master and it should be visible to
everyone now.  The tagged release for that branch is scheduled for
Friday.  See https://git.yoctoproject.org/meta-arm/tree/documentation/releases.md
for more information on the release process.

Any patches that are needed for styhead should be sent to master first
for integration, then followed by (or sent simultaneously with) an
email with the patches and "styhead" in the patch subject line.
Alternatively, adding a "Fixes:" and the SHA of the patch that it
corrects to the body of the email/patch will automatically be
backported to all of the branches that contain the error.

If there are questions, please feel free to ask.

The master branch is now open for new patches.

Thanks,
Jon

