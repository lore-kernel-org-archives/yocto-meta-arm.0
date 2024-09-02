Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084B3CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 06:35:57 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.32825.1725258954110298903
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 01 Sep 2024 23:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bN0+JlUF;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5343d2af735so3702268e87.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 01 Sep 2024 23:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725258952; x=1725863752; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4fcz+CcgafhYZq+uyS17t9YERnFp3AVHTMYGqLL3QM=;
        b=bN0+JlUFuopQWsEsUYB0eaN7xzDbR1XoPdnVQcC0Du1ERDu8q61HiSCrHO0YpKqpm5
         iqTpidbp/Q/+I0wWemJHys6ZH35yT0D56Q1XDolm2JMkxaMIXJu8iYMVncSzir8VGd6A
         /8f90lnuJd9e5zuzSi8+g6B0dEFJ3DEHPt68D4WuuR+CKX8/jU6MK/PuohwsLWbQRASQ
         WG1MH2qzjJ068hPuOhfNBKZ+I134Q26l9/aoMgARAjwOQTe2KlPjQplxSloV0TnfPH3n
         gTGYrX5s/cf4MXjvGtU2KzGJQ/YbpyFGRZmbGwcw63fHbly901mGXVp6e1gEkzcQ+Rk6
         2CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725258952; x=1725863752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4fcz+CcgafhYZq+uyS17t9YERnFp3AVHTMYGqLL3QM=;
        b=G4OxoQAceOfFqtIB7a1A5S9hxvZvncnlw6R7ujreA7FgN2+M7bz/jPZlSaLvHhU6Jm
         3t+hrKH3pFx1KKB4MgIQlE19TO1dDRd3fOd17jc+pHT2N/uPOl/DFaaxO8EQCOKtIXMX
         IwN1VQ8sD2ltZBsnspxAy5BEuSnDcJ3WMcj7RQ9ox0UtWtpPNqefpxiF4dOh7L89/7pn
         3bE6A70MOItbMv4QCb/2lM8kbzRYVmPfQmDHNhbHN4BM8/iAdTF6PmWEac9mfkmB8sdf
         JjIQg1H9UqVDQn2ofPyV39u9ml6a0SvgBINSk4C/XnCZn21NSoLYKQnTadgRRORH6qqh
         uRHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJAFerSXRBK+5dccdxhL7cVVPspJlbAcqzcmpFun6G1zuTMzoM50K+GMpF2ELvaOVlaZLzSz51ow==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzgVzC8qLJiD2NCtW4qd6+AZIIP1OQiGzszvI7nWlqsbzFLycRF
	vIAPRhBJJEaNp0mNrOgL+AQeZca/xsHOQ99N0/yTe0V8vsN8vLNHH+gbLxZbymg=
X-Google-Smtp-Source: AGHT+IEzVoatY6YFSQF2+WAzC29eKWaoeqcUl21nCUkXapd7LuJ7lErw/fCMrC9mR5ZV8FoAV+e98g==
X-Received: by 2002:a05:6512:2250:b0:530:aa4b:81c7 with SMTP id 2adb3069b0e04-53546bb91bbmr6444705e87.59.1725258951469;
        Sun, 01 Sep 2024 23:35:51 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ad1dbsm1483496e87.71.2024.09.01.23.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 23:35:50 -0700 (PDT)
Date: Mon, 2 Sep 2024 09:35:48 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Javier Tia <javier.tia@linaro.org>, meta-arm@lists.yoctoproject.org,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 05/13] sbsign.bbclass: Add class to sign binaries
Message-ID: <ZtVcxCF_-24g2O-T@nuoska>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-6-javier.tia@linaro.org>
 <ZtHTNSrczs4x90TA@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtHTNSrczs4x90TA@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Sep 2024 06:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6046

Hi,

On Fri, Aug 30, 2024 at 10:12:05AM -0400, Jon Mason wrote:
> On Thu, Aug 29, 2024 at 10:32:01AM -0600, Javier Tia wrote:
> > A lot of recipes are using these same steps to sign binaries
> > for UEFI secure boot.
> 
> Okay, I'm being overly nitpicky here.  But SB means "sign binary",
> right?  So this is "sign binary sign"?  I have a mild concern of name
> space of "SB" and I think it would generally be more obvious if "sb"
> became "signbinary" or something similar.  I don't have very strong
> feelings about it.  So feel free to ignore if you disagree.

sbsign is the name of the tool used to sign these binaries. Another tool,
pesign can also be used. For example systemd refers to sbsign and defaults
to it
https://www.freedesktop.org/software/systemd/man/latest/ukify.html#SecureBootSigningTool=SIGNER

Hence the name of this class to sbsign and variables with SBSIGN prefix.

> Also, I think this could be squashed with the previous (as I'm having
> to use a local git branch to review since these patches are split too
> small).

Ok.

Cheers,

-Mikko

> Thanks,
> Jon
> 
> > 
> > Authored-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > Signed-off-by: Javier Tia <javier.tia@linaro.org>
> > ---
> >  meta-arm/classes/sbsign.bbclass | 39 +++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 meta-arm/classes/sbsign.bbclass
> > 
> > diff --git a/meta-arm/classes/sbsign.bbclass b/meta-arm/classes/sbsign.bbclass
> > new file mode 100644
> > index 00000000..a99c0218
> > --- /dev/null
> > +++ b/meta-arm/classes/sbsign.bbclass
> > @@ -0,0 +1,39 @@
> > +# Sign binaries for UEFI secure boot
> > +# Usage in recipes:
> > +#
> > +# Set key and cert files in recipe or machine/distro config:
> > +# SBSIGN_KEY = "db.key"
> > +# SBSIGN_CERT = "db.crt"
> > +#
> > +# Set binary to sign per recipe:
> > +# SBSIGN_TARGET_BINARY = "${B}/binary_to_sign"
> > +#
> > +# Then call do_sbsign() in correct stage of the build
> > +# do_compile:append() {
> > +#     do_sbsign
> > +# }
> > +
> > +DEPENDS += "sbsigntool-native"
> > +
> > +SBSIGN_KEY ?= "db.key"
> > +SBSIGN_CERT ?= "db.crt"
> > +SBSIGN_TARGET_BINARY ?= "binary_to_sign"
> > +
> > +# makes sure changed keys trigger rebuild/re-signing
> > +SRC_URI += "\
> > +    file://${SBSIGN_KEY} \
> > +    file://${SBSIGN_CERT} \
> > +"
> > +
> > +# not adding as task since recipes may need to sign binaries at different
> > +# stages. Instead they can call this function when needed by calling this function
> > +do_sbsign() {
> > +    bbnote "Signing ${PN} binary ${SBSIGN_TARGET_BINARY} with ${SBSIGN_KEY} and ${SBSIGN_CERT}"
> > +    ${STAGING_BINDIR_NATIVE}/sbsign \
> > +        --key "${UNPACKDIR}/${SBSIGN_KEY}" \
> > +        --cert "${UNPACKDIR}/${SBSIGN_CERT}" \
> > +        --output  "${SBSIGN_TARGET_BINARY}.signed" \
> > +        "${SBSIGN_TARGET_BINARY}"
> > +    cp "${SBSIGN_TARGET_BINARY}" "${SBSIGN_TARGET_BINARY}.unsigned"
> > +    cp "${SBSIGN_TARGET_BINARY}.signed" "${SBSIGN_TARGET_BINARY}"
> > +}
> > \ No newline at end of file
> > -- 
> > 2.46.0
> > 
> > 

