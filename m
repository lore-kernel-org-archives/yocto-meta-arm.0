Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.10826.1592314970174494915
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 06:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=BMT7LCzD;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id q19so23619766lji.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Jun 2020 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SVCTTaRup9bvehgmD0UhtWe7VXmVlTcXmtWkx37DJx8=;
        b=BMT7LCzDm5bYQxCJRh9IUV3Ej7z1Z9GAKg+gGzmnuTw7s0T1z68DPWbxMLEmV5tdTt
         E4AFzgbFBrzo02RNUMVHlIklEO39Ca3u2SnXQh9X3QQN+nyPfIwE7iU4ivSveympdN/S
         7CQX2GwpGy+6qpdTyvR4weZ95Bu1/a/M5SD1WJUPF5uNlOxXJjJP52ZYGZCS0KmI4FER
         CRAI+nKlzvvtx2uNClKYg0qM+P02Awh10UAKpqGVXtfQoapVcbLnQJTYRYT7h1aodib+
         SlJJaozUQzF2TiXZClhJmpmcxdXf9SAx/gthnDdp1j3GTNx+p1qxnn7iCaq0PDjs2M8I
         AO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SVCTTaRup9bvehgmD0UhtWe7VXmVlTcXmtWkx37DJx8=;
        b=p/k2R5dQs8/0lp5cnqnFl44FUKPEisZS17TZ5fKw46dwTgIzeMtH+kZ7QF9PIwUt6A
         gsqDmw0XxW/yBTSFA5eWEI3CauURYCTV8Zot6405x6s9pGkMCebS0jVinHWiGauEZIZh
         lSGve3IhO++Zj5/LTzyliPoNv2oVFY9bPSV8+XnQsIEqv0T4z5jl+k1pbCkI1x99W4lI
         8Y7Urm/Zg3AG3qrdKuX9cKBaKjxy6mSWsa9Vt4hkUC7H3zpfd8XkJ1Gk/WZwuay+cWga
         1heQB+zyyfncXVFzQW43VXTFns9faUvY2hHEIy8qw4K4fVf0r0X9SCtTZsh5bOigx4Yk
         sg1Q==
X-Gm-Message-State: AOAM531I40/XCW7578FG+OqjwLfhrEawegQfUVY0YW6E5Lp+fK2N0cfj
	gp1qXgxuhhEz6yBq6dBW9XyT83zqx3uR9IbTmrmMzA==
X-Google-Smtp-Source: ABdhPJyyLR2nEu+9WfvW5uPK+57fLWXPxR7N+6ypjZ76v6MSNeZOPyUrAyVVNKQSZEGy1enX9/C1APD+x0XM7C71//U=
X-Received: by 2002:a05:651c:2cc:: with SMTP id f12mr1410782ljo.329.1592314968228;
 Tue, 16 Jun 2020 06:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200615162811.8860-1-khasim.mohammed@arm.com>
In-Reply-To: <20200615162811.8860-1-khasim.mohammed@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 16 Jun 2020 14:42:36 +0100
Message-ID: <CAAnfSTs3B_M693CGonZ11su-+L+Agbt44LiHVXLPZCKnGBH4Cg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: Fix the PV variable for edk2
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com, 
	Diego Sueiro <diego.sueiro@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2020 at 17:28, Khasim Mohammed <khasim.mohammed@arm.com> wrote:
> -PV ?= "201908+git${SRCPV}"

It's the ? which is the problem here, as bitbake.conf sets a value so
?= never happens.

PV = "1.2+git${SRCPV}" is the idiomatic way to do this.  Grepping poky:

recipes-bsp/u-boot/libubootenv_0.2.bb:PV = "0.2+git${SRCPV}"

And another 30-odd instances.

You'll need to set SRCREV_FORMAT to define how the two srcrevs are
turned into a PV:

SRCREV_FORMAT = "edk2_edk2-platforms"

But doing that results in a recursion error.  I scratched my head over
this for a minute before realising that it's actually pretty simple:
the SRC_URL uses destsuffix to control where the git modules are
checked out too, with absolute paths via ${S}. ${S} contains ${PV}.
${PV} depends on the source references, so that's the loop.

So the simple fix is:
1) Turn the existing PV ?= into PV =
2) Set SRCREV_FORMAT
3) Use relative paths in destsuffix (e.g. destsuffix=edk2) as the
paths are relative to ${WORKDIR}.

Ross
