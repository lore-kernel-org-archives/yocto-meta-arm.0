Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08859C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 07:42:04 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.8484.1714117320440357146
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 00:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EUlroz98;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso1760638e87.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 Apr 2024 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714117318; x=1714722118; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9yyFwbkA55IYpa1IXnkBpUqRAeRvtbd4DgK2+0Ydb0=;
        b=EUlroz98oGnHch2gf3RJx5P4VVSbp0knxdNaKDWOA6LpOkp9Xb0AFUcScJbSkC5lBw
         DwKsPSyReMCxGpiUxTxiTHx9CqEhdaptmcdaWuOCOwf7kAcctqovAx7Ur6GpE+Ra/JB8
         c6sjbVjr3rT3UT4JeteP1r382yBWZ2TMeGrl9DOisD1wnURTBWUMw90YHXHLhVR/lFFs
         dUD/dB8oPuiEdRU0xKbs3deOaoPPYxbmDvAd69+Uq+IGjcyCkAYKSbZbLhikDFFI8ztc
         qtYSOIS5gp5X8A4cUZnm2CC2FxsHW5m9x79tLIuowWbv9xLarXMa++HuvgOKnJHsqab3
         idxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714117318; x=1714722118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9yyFwbkA55IYpa1IXnkBpUqRAeRvtbd4DgK2+0Ydb0=;
        b=WzvtEMQ5cqMq22ux5AtFLidLIV/cy68ZzR/r9bise9QqprVGfMd7Pj96QCkTX/WV8f
         Y3hlsHSXsbpnVeBkk+4oAwsr7pnmCq4GsRO9no2QM5NxYhQCmHzi5ceTeabCTFcsOyvB
         GTHyemn1OqNqwdj1aCmfiXGThRfwZc6uRMBoce31tzO9AfPtALwehW+dhe3R+pZeDrya
         BjClcgtPLEA/LTdR99+yiI1LhCctOKr/mmbF6Ze7S4WlJ+b7GZsUnnvCDoSg6WcuV352
         cCua+y07nH/WHCCwdJuBHWcu/zQr/heBrEs715/cm4kmXzsQUiCmKFPnQM6DbH1FihRt
         HsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXpZQIvVZCCkYE7ZGTZGjC23RsXVaguNKWMLHsBCK8d1qltSfMt8lY14zI+uqaUFF6jJqzWar4Wctf0FSCRPYxdopsr/96RpybjNfkbtfu
X-Gm-Message-State: AOJu0YwnyIrs6p4pqx0rsY+j6byE6BVR68OsC5HpvZOZ9CkSW746MF05
	J+xtvT3h8323BIgWmE+g3NVlS/1RlJgpjZWQhJIxx7/PgsWGKSVDLsvRe3Qpj6Y=
X-Google-Smtp-Source: AGHT+IH7p7FDTNr5x9fb20pKZXhwD68h2Wg7s0A0Ozr02QG0oafuPJJE3rDAxLsTBUWkEXfejGnlKA==
X-Received: by 2002:a19:3855:0:b0:518:f4e9:201c with SMTP id d21-20020a193855000000b00518f4e9201cmr1704179lfj.16.1714117318451;
        Fri, 26 Apr 2024 00:41:58 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id b30-20020a056512025e00b0051bc39ef08esm1066423lfo.10.2024.04.26.00.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 00:41:57 -0700 (PDT)
Date: Fri, 26 Apr 2024 10:41:56 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: mathieu.poirier@linaro.org
Cc: Jon Mason <jdmason@kudzu.us>, jon.mason@arm.com, ross.burton@arm.com,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v3] arm/trusted-firmware-rmm: Add bitbake,
 include and patch file for RMM
Message-ID: <ZitaxMaL9hCaVWIh@nuoska>
References: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
 <CANLsYky=iWo_zcx0A4=gcbwH+iCWN=d0Mgvsd12c-ON8WhLByQ@mail.gmail.com>
 <Zif6rHi5B3lB4W53@kudzu.us>
 <CANLsYkwzNp7QW_cAn-0Mt=r0rFJyFt0NAxc8S8f2uYCibrngzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkwzNp7QW_cAn-0Mt=r0rFJyFt0NAxc8S8f2uYCibrngzA@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Apr 2024 07:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5610

Hi,

On Wed, Apr 24, 2024 at 10:18:37AM -0600, Mathieu Poirier via lists.yoctoproject.org wrote:
> On Tue, 23 Apr 2024 at 12:15, Jon Mason <jdmason@kudzu.us> wrote:
> > Please do keep abreast of the upstream changes, as I'd like for there
> > to be a CI testcase once that part is sorted out (and I'm counting on
> > you to add the CI test).
> >
> 
> Is there a documented process for CI?  I looked in the README.md, the
> documentation and CI folders but found nothing of that sort.  Due to
> their similarities, I'll start looking into what is done for Hafnium.

I had similar questions after breaking thing:

.gitlab-ci.yml and ci directories have the magic build and test matrix.

For example qemuarm64-secureboot machine build and tests are run with
this command which Ross showed me over irc:

$ kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml

To debug the build and test environment you can run:

$ kas shell ci/qemuarm64-secureboot.yml:ci/testimage.yml

and then there to check how image and other variables
are formed:

$ bitbake -e core-image-base | less

To boot into the image shell manually (testimage does this automatically):

$ runqemu slirp nographic novga core-image-base

The ci/testimge.yml config runs oeqa runtime tests which
are defined TEST_SUITES variable. Tests live in
${LAYER}/lib/oeqa/runtime/cases/ as .py files, and
basically execute commands on the booted qemu target with
ssh. Often tests need additional binaries on target image
which are installed via IMAGE_INSTALL variable in kas config
files for the machine, and then test, which is part of
TEST_SUITES variable, just runs the binaries and checks
return values.

https://docs.yoctoproject.org/dev/singleindex.html#running-tests

Hope this helps,

-Mikko

