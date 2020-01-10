Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.7517.1578645202422575389
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2020 00:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=O0iNwfVX;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id r14so820704lfm.5
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2020 00:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=CKvC/aBXzj75XRLo6aXmrbsEuXEWt5Dtz2FoPaerbBE=;
        b=O0iNwfVXKxUaHkVxhxKvsz074Iyw58eMZiIDn25NseE83Gey2VRuOEaDkrprc1JkRl
         VtdQw04gkPnVZtgcyTl5izWK4DLCes4Ga+VKp5FlPWI687trZeNTeIUT1s0zpXe8B6Fe
         kwZspcKH5xJjbN1Cj+JqoCEpH4nyEXq8eESPeXM1JRjmkcAfqY8COxasaDdjKntukSVV
         S3gfceSQGg0m54eCRIOcNxEIye2ol14QkOQ8mrNL3WAu0tK/gkf31ot9EqElAfOQMl0c
         xKikOurdTxDAC3nepDK9nnWKEuRdqbJ0Ea4KmPE/cdBv8T2FWM7PbUgHEDI4XBZPfgJ6
         lDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=CKvC/aBXzj75XRLo6aXmrbsEuXEWt5Dtz2FoPaerbBE=;
        b=TLbFv3xzWDqDmOPRwrR6jGX4caR+SG0hKQ3h1cFRdxW0VKbPR2rw6bVjqm5M0KhIK/
         WGNT3DK3iE8Pnh8jzWAgoUMKdydSnCV34ydIyRPDDxIFhtk5pbCs/uCgk+9qm6cSfRkr
         lO8pxpmv2Ow9WS19beho5aCI9Jr388iVfBtDEpubKUuIIeecfYddX6PHvfxKiOUo+xlb
         AU935uS7ci2p2o78b83MC3T5xrvXOfg354JJDF5MjkVlYO0PbcPyRm3XOGJgYwlBtYS1
         Q+rl1eAJ1oxtoZDk0BPP8+SJigiuZNkwiIaGC4kVssZMUxdV6965L7Q24ZhldGeQohzn
         nM0g==
X-Gm-Message-State: APjAAAWZ9C3d+aZ9gKLbYf5gZqPqdbu2awsQ71bv0zgQLDqA9tqOd0TS
	k+mAS/IcRkJytYj0cLZD9GGa3SdHhF2VdHOS+bJw9KI/ZTY=
X-Google-Smtp-Source: APXvYqwr8L133A68jpP1GlpC9Zbw3A2jyUW5do/fInfUh93YMrUP/oZ8sY2lxN/ZoAx+jtPLq5yTvk4a0GFeUlhNPLA=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr1501619lfh.102.1578645199897;
 Fri, 10 Jan 2020 00:33:19 -0800 (PST)
MIME-Version: 1.0
References: <f328d6db-3432-7b9b-2981-3bb18aa0b857@arm.com>
In-Reply-To: <f328d6db-3432-7b9b-2981-3bb18aa0b857@arm.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 10 Jan 2020 09:33:07 +0100
Message-ID: <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm layer update
To: meta-arm@lists.yoctoproject.org, Peter Griffin <peter.griffin@linaro.org>, 
	Khem Raj <raj.khem@gmail.com>, Fathi Boudra <fathi.boudra@linaro.org>, 
	Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Jon!

On Tue, Jan 7, 2020 at 11:35 PM Jon Mason <jon.mason@arm.com> wrote:
>
> The meta-arm layer is now publicly available at
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
>
> It is still under active development, and I encourage everyone who would
> like to contribute to read
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/README.md

many thanks for starting this effort!

Some initial comments/thoughts:

1. We are interested in moving the OP-TEE recipes that we've
maintained in meta-linaro for quite some time, over there. We will be
looking into that soon.
2. I have very quickly browsed through the files, and noticed that you
are setting DISTRO_FEATURES within machine configuration meta data
(juno.conf), this really needs to be removed, as it's a bad practice.
If someone builds their own distro/apps for 'juno' you shouldn't
change their distro config.
3. We have some juno machine definition in meta-96boards, and we
should look at cleaning things up a bit to avoid duplication

>
>
> Also, some of the layers are now present on the OpenEmbedded layer
> index.  Specifically,
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm-b=
sp/
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm/
>
> The meta-arm-iota layer was rejected due to not having a distro
> definition in it, and generally being empty.  I will attempt to add it
> again once code has been pushed to that location.
>
>
> Thanks,
> Jon
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>=20
