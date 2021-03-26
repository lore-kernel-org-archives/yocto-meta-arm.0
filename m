Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.12400.1616765196134791701
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 06:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=sUsRJmCT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id 7so5131735qka.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Icz8MTZvTzXkDLlGnybgupk+A0IjzxEc68KYqrltMVA=;
        b=sUsRJmCTBASiI6pZ+wfUDjgzSeBy9MThFUnVlXtP4OR6CSUrCm5GY5R3f9hae+P68S
         Z3fB4eNc/1e61fmIpZ9YYx3wChzhGzo3ONjAsBguxEmanadW3xk/6KdJABeIADKHMV8+
         CQyVvbJ7d86FLX2CQcqSokGnS5MYNb8Hwm1yEOvHXyH/ipL7AEvMyhWoTFZhdRnQQdfg
         JkCfElsQ1JOSLYGB2yyDRQ3ioNOL8LU2cueYAq+H/qYrYSEq0DL5+Y0JOyL1Xjx32s05
         0o2WXjwao3KZ97yeGIBitAn1PthJt4yJGAy3NxpqhXSVDyG3D/EhZCa63IgtzxI5P+XH
         QUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Icz8MTZvTzXkDLlGnybgupk+A0IjzxEc68KYqrltMVA=;
        b=tZPgQoGCfF5Qj3XU0jTT6Edpu5D4m4wo685rt7AMX6I/0dETzZuoEtbn+yYDrCNLtl
         ZYujWKV1epNLkZoEIBYJWS/Iaf5vOxcHDUhsx2tLoUym2sno0zsaxNbhVc53GGXCs8Ti
         c4w0MxyAgCfF/KRbB/aiggrklQ1wRWeb5bb3WN2d7ho5DCzc1ULgi3iU1AD9sXk6V998
         SOHwrwZeasYZ4VlddLYBtRW45pnudHADAsmNCMkccgj0yqieAr1tUON3sle1TipK4TNG
         Xewy/lkjywtVjRrZ60iB64uJ2cuT0fS+VNuPFLtwClapbfBZhfyrxCt1lPSyvJ5lCMY1
         u1sQ==
X-Gm-Message-State: AOAM530c2Ju3RLgMMjrs0WIn1IArUuIMy67gf3h0uFR+TawhGtfahAhy
	XbR3h1frZytZYPQ7FFTd0mcMVg==
X-Google-Smtp-Source: ABdhPJx3wBciqBNN6Y10tHXvOA7fitai/Ld2AmS79psdGVhrkks4DfENk92SKNwnuRi8A2rD26mLew==
X-Received: by 2002:ae9:e80b:: with SMTP id a11mr12772330qkg.65.1616765195176;
        Fri, 26 Mar 2021 06:26:35 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:b033:7c0e:2324:b6dc])
        by smtp.gmail.com with ESMTPSA id c7sm2890803qtv.48.2021.03.26.06.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 06:26:35 -0700 (PDT)
Date: Fri, 26 Mar 2021 09:26:33 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/3] arm-autonomy/classes: Introduced set_src_uri_from_var.bbclass
Message-ID: <20210326132633.GB9653@kudzu.us>
References: <20210324153257.4716-1-nathan.dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210324153257.4716-1-nathan.dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 24, 2021 at 03:32:55PM +0000, Nathan Dunne wrote:
> From: Nathan Dunne <Nathan.Dunne@arm.com>
> 
> Introduced set_src_uri_from_var.bbclass to add entries to the
> SRC_URI based on a named variable, and generate a manifest
> file alongside fetched items containing a number of parameters
> for each entry.
> 
> Parameters can have an optional default value, or cause an error
> if omitted.
> 
> Issue-Id: SCM-2225
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: Ia85b3f4bc3fa666fa7e7aec2d670979ac9348f52
> ---

Series pulled into master.

Thanks,
Jon

>  .../classes/set_src_uri_from_var.bbclass      | 224 ++++++++++++++++++
>  1 file changed, 224 insertions(+)
>  create mode 100644 meta-arm-autonomy/classes/set_src_uri_from_var.bbclass
> 
> diff --git a/meta-arm-autonomy/classes/set_src_uri_from_var.bbclass b/meta-arm-autonomy/classes/set_src_uri_from_var.bbclass
> new file mode 100644
> index 0000000..b2d8aec
> --- /dev/null
> +++ b/meta-arm-autonomy/classes/set_src_uri_from_var.bbclass
> @@ -0,0 +1,224 @@
> +# Set SRC_URI from Variable
> +
> +# This class parses a variable named in SRC_URI_FROM_VAR_NAME for entries that
> +# should be added to the SRC_URI
> +#
> +# There are 4 supported formats for entries:
> +#
> +# - http/https url
> +#   - Note that a checksum (md5sum or sha256sum) must be provided for http(s)
> +#
> +# - file:// absolute local path from root
> +#   - In this case the filename will be added to SRC_URI and the path from '/'
> +#   added to FILESEXTRAPATHS
> +#
> +# - file:// path relative to FILESEXTRAPATHS
> +#   - In this case the filename will be added to SRC_URI and the preceding path
> +#   added to FILESOVERRIDES, so that the full path to the file will
> +#   be available in FILESPATH when it is generated by combining
> +#   FILESEXTRAPATHS and FILESOVERRIDES.
> +#
> +# - plain absolute local path from root
> +#   - This will be treated the same as an file:// path from root. Plain paths
> +#   must be absolute, and cannot be relative to FILESEXTRAPATHS
> +#
> +# It is not recommended to use other yocto URL types, as they may result in
> +# undefined behaviour.
> +#
> +# These entries will be added to the SRC_URI so that the yocto fetcher can
> +# unpack a copy into ${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}
> +#
> +#
> +# A list of arguments can follow each entry in the input variable, seperated
> +# by semi-colons (;). Arguments may be FETCH arguments or MANIFEST arguments.
> +#
> +# FETCH arguments will be appended to the entry in SRC_URI, for example
> +# "downloadfilename" to specify the filename used when storing a
> +# downloaded file.
> +# Each SRC_URI entry will automatically have the arguments
> +# "unpack=0;subdir=${SRC_URI_FROM_VAR_UNPACK_DIR}" added to them, so do not
> +# attempt to set these options.
> +#
> +# MANIFEST arguments are defined in the variable
> +# SRC_URI_FROM_VAR_MANIFEST_PARAMS which should be a space seperated list of
> +# names, each optionally followed by an equals sign (=) and a default value.
> +#
> +# The values provided for the manifest arguments will be written to the manifest
> +# file in ${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR} as columns, in the same
> +# order as they appear in SRC_URI_FROM_VAR_MANIFEST_PARAMS.
> +#
> +# For entries that do not provide a value for a manifest argument, the default
> +# value will be used if possible.
> +# If no default is availale, omitting the parameter on any item will cause
> +# an error.
> +#
> +# "[basename]" is a special case default that will set the value to
> +# the filename without the path or file extension.
> +#
> +# e.g.
> +# SRC_URI_FROM_VAR_MANIFEST_PARAMS="conname=[basename] contag=local conkeep"
> +#
> +# Any arguments that follow an entry in SRC_URI_FROM_VAR_NAME, that are not
> +# named in SRC_URI_FROM_VAR_MANIFEST_PARAMS are assumed to be FETCH arguments,
> +# so are added to the corresponding entry in the SRC_URI.
> +
> +SRC_URI_FROM_VAR_NAME ??= ""
> +SRC_URI_FROM_VAR_MANIFEST_PARAMS ??= ""
> +SRC_URI_FROM_VAR_UNPACK_DIR ??= "items"
> +
> +python __anonymous() {
> +
> +    parse_var = d.getVar('SRC_URI_FROM_VAR_NAME')
> +
> +    if not parse_var:
> +        return
> +
> +    parse_var_items = d.getVar(parse_var)
> +
> +    if parse_var_items:
> +        for item in parse_var_items.split(' '):
> +            if not item:
> +                continue
> +
> +            if item.startswith('/'):
> +                # If not a Yocto URL, must be an absolute path
> +                yocto_url = "file://" + item
> +            else:
> +                # Otherwise assume valid Yocto URL.
> +                # Error case is caught later
> +                yocto_url = item
> +
> +            fetcher = host = path = parm = None
> +            try:
> +                # Attempt to parse a Yocto URL
> +                fetcher,host,path,_,_,parm = bb.fetch.decodeurl(yocto_url)
> +            except:
> +                # Something invalid is in the variable!
> +                raise bb.parse.SkipRecipe(parse_var + \
> +                                          " contains an invalid entry:\n'" + \
> +                                          item + "'")
> +
> +            # This var is space seperated list of parameter names,
> +            # with optional default value following an equals sign
> +            # (name=default)
> +            item_params_str = d.getVar('SRC_URI_FROM_VAR_MANIFEST_PARAMS')
> +
> +            # remove directories from path
> +            filename = os.path.basename(path)
> +
> +            if "downloadfilename" in parm:
> +                filename = parm["downloadfilename"]
> +
> +            item_manifest_args = {"filename": filename}
> +
> +            if item_params_str:
> +                # required manifest arguments have been provided
> +
> +                # If no default is given add "=" for map parsing
> +                item_params_list = [ arg + "=" if '=' not in arg
> +                                     else arg
> +                                     for arg in item_params_str.split(' ')
> +                                   ]
> +
> +                # Generate key value pairs of argument names and
> +                # default values
> +                item_params_map = dict( (name.strip(), val.strip())
> +                                        for name, val in (arg.split('=')
> +                                        for arg in item_params_list)
> +                                      )
> +
> +                for argname in item_params_map:
> +                    # Iterate over required manifest arguments
> +
> +                    argvalue = parm.pop(argname, None)
> +                    if argvalue:
> +                        # a value has been provided for this item
> +                        item_manifest_args[argname] = argvalue
> +
> +                    else:
> +                        # No value provided, process default value
> +                        default = item_params_map[argname]
> +                        if default:
> +                            # A default value is provided
> +                            if default == "[basename]":
> +                                # use the filename without extension
> +                                default = os.path.splitext(filename)[0]
> +
> +                            # store default value in dict
> +                            item_manifest_args[argname] = default
> +
> +                        else:
> +                            # No default provided
> +                            raise bb.fatal(parse_var + \
> +                              " entry is missing a required parameter '" + \
> +                              argname + "':\n'" + item + "'")
> +
> +            # Write value to var flags to ensure data structure is preserved
> +            # Each entry of parse_var will have a varflag  where the value
> +            # is a dictionary of argument names and values
> +            d.setVarFlags(parse_var, {item: item_manifest_args})
> +
> +            src_uri_entry_suffix = ';'
> +
> +            # HTTP(S) fetcher must provide a checksum
> +            if fetcher.startswith('http') and not \
> +            ( 'md5sum' in parm or 'sha256sum' in parm ):
> +                # Ensure http/https fetchers get a checksum
> +                raise bb.parse.SkipRecipe(parse_var + \
> +                                          " entry is missing a checksum:\n'" + \
> +                                          item + "'")
> +
> +            # add remaining fetch parameters including checksum
> +            for arg in parm:
> +                src_uri_entry_suffix += ";" + arg + "=" + parm[arg]
> +
> +            # Add default and extra parameters to SRC_URI entry
> +            src_uri_entry_suffix += ';unpack=0;subdir=' + \
> +                                    d.getVar('SRC_URI_FROM_VAR_UNPACK_DIR')
> +
> +            if fetcher == 'file':
> +                # Prevent local fetcher from re-creating dir structure
> +                filedir = os.path.split(path)[0]
> +                if filedir.startswith('/'):
> +                    # Path is from the root
> +                    d.appendVar('FILESEXTRAPATHS', filedir + ':')
> +                else:
> +                    # Path is relative to FILESEXTRAPATHS
> +                    d.appendVar('FILESOVERRIDES', ':' + filedir)
> +
> +                # Add filename without path to SRC_URI
> +                d.appendVar('SRC_URI', ' file://' + \
> +                                        filename + src_uri_entry_suffix)
> +            else:
> +                # Add full entry to SRC_URI
> +                d.appendVar('SRC_URI', ' ' + fetcher + \
> +                            "://" + host + path + src_uri_entry_suffix)
> +}
> +
> +python generate_manifest() {
> +
> +    parse_var = d.getVar('SRC_URI_FROM_VAR_NAME')
> +
> +    if not parse_var:
> +        return
> +
> +    target_dir = os.path.join(d.getVar('WORKDIR'),
> +                              d.getVar('SRC_URI_FROM_VAR_UNPACK_DIR'))
> +
> +    # Write a manifest file containing the parameters so SRC_URI
> +    # doesn't need to be parsed by do_install
> +    with open (target_dir + "/manifest", 'w') as manifest_file:
> +        manifest_args = d.getVarFlags(parse_var)
> +
> +        parse_var_items = d.getVar(parse_var)
> +
> +        if parse_var_items:
> +            for item in parse_var_items.split():
> +
> +                manifest_file.write(" ".join(manifest_args[item].values())+"\n")
> +
> +}
> +
> +do_unpack[cleandirs] += "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}"
> +do_unpack[postfuncs] += "generate_manifest"
> +do_unpack[vardeps] += "${SRC_URI_FROM_VAR_NAME}"
> -- 
> 2.17.1
> 

> 
> 
> 

